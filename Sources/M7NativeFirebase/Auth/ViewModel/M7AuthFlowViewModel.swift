//
//  File.swift
//  
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

public class M7AuthFlowViewModel: ObservableObject {
    
   
    
    // Navigation
    @Published public var showModal = false
    @Published public var navigationLink: Int? = 0
    @Published public var navigationLinkCreateAccount: Int? = 0
    
    // Email
    @Published public var email = ""
    @Published public var password = ""
    
    @Published public var emailSignUp = ""
    @Published public var passwordSignUp = ""
    
    @Published public var isEmailError = false
    @Published public var errorText = ""
    // @Published var isLinkSend = false
    // @Published var isSignUp = false
    
    // SMS
    @Published public var smsCode = ""
    @Published public var phoneNumber = ""
    @Published public var smsErrorText = ""
    @Published public var isSmsError = false
    @Published public var ID : String = ""
    
    // Form
    @Published public var username = "Anonimus"
    @Published public var firstName = ""
    @Published public var lastName = ""
    @Published public var pic = ""
    @Published public var bio = ""
    
    
    @Published public var uid =  ""
    
    public var status: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.Status") }
        get { UserDefaults.standard.bool(forKey: "Auth.Status") }
    }
    
    
    
    // Loading
    
    @Published public var isLoading = false
    
    let db = Firestore.firestore()
    
    @EnvironmentObject var authenticationService: AuthenticationService
    
    //public init() {}
    
    public init() {
        
//        if Auth.auth().currentUser == nil {
//          Auth.auth().signInAnonymously()
//            self.checkUser()
//        }
        
        //self.uid = authenticationService.uid
        
        self.uid = Auth.auth().currentUser?.uid ?? ""

        if status {
            
           //
            self.checkUser()
            

            

        } else {

            
            Auth.auth().signInAnonymously() { (authResult, error) in

                guard let user = authResult?.user else { return }
                self.uid = user.uid
                
                self.isUserDataCreated { (data) in
                    
                    if data == false {
                        print("Account chek: false")
                        
                        self.createAccount()
                        
                        
                    }
                    
                    print("Account chek: true")
                    
                }
            }
        }
        
        print("This" + uid + "<-")
        

    }
    
    public func emailCheck() {
        navigationLink = 1
    }
    
    public func signUp() {
        
        navigationLink = 2
        
    }
    
    public func sendAuthSMS() {
        
        isLoading = true
        
       // Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                self.isLoading = false
                
                self.errorText = error.localizedDescription
                print(self.phoneNumber)
                print(self.errorText)
                return
            }
            self.isLoading = false
            print("Все ок")
            print(self.phoneNumber)
            self.navigationLink = 1
            self.ID = verificationID ?? ""
            
        }
        
    }
    
    public func chekSMS() {
        
        isLoading = true
        
      
        let prevUser = Auth.auth().currentUser
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: smsCode)
        
        Auth.auth().signIn(with: credential) { (res, err) in
            
            if err != nil{
                
                self.isLoading = false
                
                self.errorText = err!.localizedDescription
                
                self.isLoading = false
                return
            }
            
            self.isLoading = false
            self.status = true
            
            self.uid = res?.user.uid ?? ""
            self.checkUser()
           
            
        }
        
        prevUser?.link(with: credential) { (authResult, error) in
          
            if let error = error {
                print(error)
                return
            }
            
        }
    }
    
    public func createAccount() {
        self.isLoading = true
      
        db.collection("users").document(uid).setData([
        
                        "uid": uid,
                        "username": username,
                        "firstName": firstName,
                        "lastName": lastName,
                        "pic": pic,
                        "bio": bio,
                        "dateCreated": Date()
            
        ]) { (err) in
         
            if err != nil{
                self.isLoading = false
                return
            }
            self.isLoading = false
            // success means settings status as true...
            self.status = true
            self.showModal = false
            
            print("accountCreate")
        }
        
    }
    
    public func checkUser() {
        
        db.collection("users").document(uid).getDocument { (doc, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
                
            } else {

                guard let user = doc else { return }
    
                let uid = user.data()?["uid"] as? String
                
                if uid == nil {
                    self.navigationLinkCreateAccount = 88
                   
                } else {
                    self.showModal = false
                }
            }
        }
        
    }
    
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

    
    
//    public func isUserDataCreated() -> Bool {
//
//        db.collection("users").document(uid).getDocument { (doc, err) in
//
//            if let err = err {
//                print("Error getting documents: \(err)")
//
//                return false
//
//            } else {
//
//                guard let user = doc else {   return false }
//
//                let uid = user.data()?["uid"] as? String
//
//                if uid == nil {
//                    return false
//
//                }
//
//                return true
//            }
//
//
//        }
//
//
//    }
    
    
    public func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            
            self.status = false
        }
        
        // clearing all data...
        
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
        
        navigationLink = 0
    }
    
}
