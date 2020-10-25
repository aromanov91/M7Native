//
//  File.swift
//  
//
//  Created by 18391981 on 17.10.2020.
//

import Combine
import Firebase
import FirebaseFirestoreSwift

public class AuthenticationService: ObservableObject{
    
    @Published public var currentUser = Auth.auth().currentUser
    
    @Published public var uid =  Auth.auth().currentUser?.uid ?? ""
    
    @Published public var userData = UserData(username: "", pic: "", bio: "")
    
    @Published public var ID: String = ""
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    private let db = Firestore.firestore()
    
    public var status: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.Status") }
        get { UserDefaults.standard.bool(forKey: "Auth.Status") }
    }
    
    private var isAuthActivationProgress: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.IsAuthActivationProgress") }
        get { UserDefaults.standard.bool(forKey: "Auth.IsAuthActivationProgress") }
    }
    
    public init() {
        
        if status == false {
            
            if isAuthActivationProgress == false {
                
                isAuthActivationProgress = true
                
                registerStateListener()
            }
        }
        
        fetchUserData(uid: uid) { (user) in
            self.userData = user
        }
    }
    
    public func registerStateListener() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        self.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("Sign in state has changed.")
            self.currentUser = user
            self.uid = user?.uid ?? ""
            
            if let user = user {
                let anonymous = user.isAnonymous ? "anonymously " : ""
                print("User signed in \(anonymous)with user ID \(user.uid). Email: \(user.email ?? "(empty)"), display name: [\(user.displayName ?? "(empty)")]")
            }
            else {
                print("User signed out.")
                self.signInAnonymously()
            }
        }
        
        
        //        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        //                self.currentUser = user
        //
        //                if user == nil {
        //
        //                } else {
        //
        //                }
        //
        //            }
        //
    }
    
    // MARK: - SMS Auth
    
    public func sendAuthSMS(phoneNumber: String, complition: @escaping (Result<Bool, Error>) -> Void) {
        
        // Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("⛔️ SMS error: " + error.localizedDescription)
                complition(.failure(error))
            }
            self.ID = verificationID ?? ""
            print("✅ SMS Sended")
            print("📱 Auth number: " + phoneNumber)
            complition(.success(true))
            
        }
    }
    
    public func chekSMS(smsCode: String, complition: @escaping (Result<Bool, Error>) -> Void) {
        
        let unauthUser = currentUser
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: smsCode)
        
        Auth.auth().signIn(with: credential) { (res, error) in
            
            if let error = error {
                print("⛔️ Check SMS error: " + error.localizedDescription)
                complition(.failure(error))
            }
            
            self.status = true
            self.currentUser = res?.user
            self.uid = res?.user.uid ?? ""
            
        }
        
        unauthUser?.link(with: credential) { (authResult, error) in
            
            if let error = error {
                print("⛔️ Accounts merged error: " + error.localizedDescription)
                complition(.failure(error))
            }
            
        }
        
        complition(.success(true))
        print("✅ Accounts merged")
    }
    
    // MARK: - Create Account
    
    public func createAccount(_ user: UserData, complition: @escaping (Result<Bool, Error>) -> Void) {
        
        do {
            let _ = try db.collection("users").addDocument(from: user)
            print("✅ Account create")
            complition(.success(true))
            
        }
        catch {
            print("⛔️ Accounts merged error: " + error.localizedDescription)
            complition(.failure(error))
        }
    }
    
    //    public func checkUser() {
    //
    //        db.collection("users").document(uid).getDocument { (doc, err) in
    //
    //            if let err = err {
    //                print("Error getting documents: \(err)")
    //
    //            } else {
    //
    //                guard let user = doc else { return }
    //
    //                let uid = user.data()?["uid"] as? String
    //
    //                if uid == nil {
    //                    self.navigationLinkCreateAccount = 88
    //
    //                } else {
    //                    self.showModal = false
    //                }
    //            }
    //        }
    //
    //    }
    
    public func isUserDataCreated(completion: @escaping(Result<Bool, Error>) -> Void) {
        
        db.collection("users").document(uid).getDocument { (document, error) in
            if let error = error {
                print("⛔️ Check SMS error: " + error.localizedDescription)
                completion(.failure(error))
            }
            
            if let document = document, document.exists {
                print("🙋‍♂️ Document exists")
                completion(.success(true))
            } else {
                print("🙅‍♂️ Document does not exists")
                completion(.success(false))
            }
        }
        
        
    }
    
    // MARK: - Sign In Anonymously
    
    public func signInAnonymously() {
        
        if Auth.auth().currentUser == nil {
            
            Auth.auth().signInAnonymously() { (authResult, error) in
                
                self.isAuthActivationProgress = false
                
                guard let user = authResult?.user else { return }
                print("✅ Sign In Anonymously")
                self.currentUser = user
                self.uid = user.uid
                
                self.isUserDataCreated { (result) in
                    
                    
                    switch result {
                    
                    case .success(let data):
                        
                        if data == false {
                            
                            print("🙅‍♂️  Account chek: false")
                            
                            self.createAccount(UserData(username: "", pic: "", bio: "")) { result in
                                
                                switch result {
                                
                                case .success(_): break
                                    
                                case .failure(_): break
                                    
                                }
                            }
                        }
                        
                        print("🙋‍♂️ Account chek: true")
                            
                        
                    case .failure(let error):
                        print("⛔️ Check UserData error: " + error.localizedDescription)
                    }
                    
                    

                    
                }
            }
            
        }
        
        
        
    }
    
    
    // MARK: - Fetch User Data
    
    public func fetchUserData(uid: String, completion: @escaping (UserData) -> Void) {
        
        if Auth.auth().currentUser != nil {
            
            let thisUser = db.collection("users").document(uid)
            
            thisUser.getDocument(completion: { snapshot, error in
                
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                
                print("✅ Fetch user data Success")
                let user = try? snapshot?.data(as: UserData.self)
                
                completion(user ?? UserData(username: "", pic: "", bio: ""))
            })
            
        }
    }
    
    // MARK: - Log Out
    
    public func logOut(){
        
        // logging out..
        
        try! Auth.auth().signOut()
        status = false
    }
    
    // MARK: - User propertis
    
    public func changeDisplayName(displayName: String, completion: @escaping (Result<User, Error>) -> Void) {
    
        if let user = Auth.auth().currentUser {
            
          let changeRequest = user.createProfileChangeRequest()
          changeRequest.displayName = displayName
          changeRequest.commitChanges { error in
            if let error = error {
                completion(.failure(error))
            }
            else {
              if let updatedUser = Auth.auth().currentUser {
                print("Successfully updated display name for user [\(user.uid)] to [\(updatedUser.displayName ?? "(empty)")]")
                self.currentUser = updatedUser
                completion(.success(updatedUser))
              }
            }
          }
        }
    }
    
}
