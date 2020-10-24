//
//  File.swift
//  
//
//  Created by 18391981 on 17.10.2020.
//

import Combine
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

public class AuthenticationService: ObservableObject{
    
    @Published public var userData = UserModel(username: "", firstName: "", lastName: "", pic: "", bio: "")
    
    @Published public var currentUser = Auth.auth().currentUser
    
    @Published public var uid =  Auth.auth().currentUser?.uid ?? ""
    
    @Published public var ID: String = ""
    
    private let db = Firestore.firestore()
    
    public var status: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.Status") }
        get { UserDefaults.standard.bool(forKey: "Auth.Status") }
    }
    
    public init() {
        
        self.currentUser = Auth.auth().currentUser
        self.uid =  Auth.auth().currentUser?.uid ?? ""
        
        if status {
            
            fetchUserData(uid: uid) { (user) in
                self.userData = user
            }
            
        } else {
            
            
            signInAnonymously()
            
        }
        
        print("This" + uid + "<-")
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
            //            self.checkUser()
            
            
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
    
    public func createAccount(_ user: UserModel, complition: @escaping (Result<Bool, Error>) -> Void) {
        
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
    
    public func isUserDataCreated(completion: @escaping(Bool) -> ()) {
        
        db.collection("users").document(uid).getDocument { (document, error) in
            if let document = document, document.exists {
                print("document exists.")
                completion(true)
            } else {
                print("document does not exists.")
                completion(false)
            }
        }
        
        
    }
    
    // MARK: - Sign In Anonymously
    
    public func signInAnonymously() {
        
        if currentUser == nil {
            
            Auth.auth().signInAnonymously() { (authResult, error) in
                
                guard let user = authResult?.user else { return }
                print("✅ Sign In Anonymously")
                self.currentUser = user
                self.uid = user.uid
                
                self.isUserDataCreated { (data) in
                    
                    if data == false {
                        
                        print("🙅‍♂️  Account chek: false")
                        
                        self.createAccount(UserModel(username: "", firstName: "Anonymously", lastName: "", pic: "", bio: "")) { result in
                            
                            switch result {
                            
                            case .success(_): break
                                
                            case .failure(_): break
                                
                            }
                            
                        }
                        
                    }
                    
                    print("🙋‍♂️ Account chek: true")
                    
                }
            }
            
        }
        
    }
    
    
    // MARK: - Fetch User Data
    
    public func fetchUserData(uid: String, completion: @escaping (UserModel)-> Void) {
        
        let thisUser = db.collection("users").document(uid)
        
        thisUser.getDocument(completion: { snapshot, error in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            print("✅ Fetch user data Success")
            let user = try? snapshot?.data(as: UserModel.self)
            
            completion(user ?? UserModel(username: "", firstName: "", lastName: "", pic: "", bio: ""))
        })
    }
    
    // MARK: - Log Out
    
    public func logOut(){
        
        // logging out..
        
        try! Auth.auth().signOut()
        status = false
    }
    
}
