//
//  File.swift
//  
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

public class M7AuthModel: ObservableObject {
    
    
    
    public init() {}
    
    // Navigation
    @Published public var showModal = false
    @Published public var navigationLink: Int? = 0
    
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
    @Published public var firstName = ""
    @Published public var lastName = ""
    
    public var status: Bool {
        set { UserDefaults.standard.set(newValue, forKey: "Auth.Status") }
        get { UserDefaults.standard.bool(forKey: "Auth.Status") }
    }
    
    // Loading
    
    @Published public var isLoading = false
    
    public func emailCheck() {
        navigationLink = 1
    }
    
    public func signUp() {
        
        navigationLink = 2

    }
    
    public func sendAuthSMS() {
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
            self.errorText = error.localizedDescription
            print(self.phoneNumber)
            print(self.errorText)
            return
          }
            
            print("Все ок")
            print(self.phoneNumber)
            self.navigationLink = 1
            self.ID = verificationID ?? ""
            
        }
        
    }
    
    public func chekSMS() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: smsCode)
                        
                        Auth.auth().signIn(with: credential) { (res, err) in
                            
                            if err != nil{
                                self.errorText = err!.localizedDescription
                              
                                self.isLoading = false
                                return
                            }
                            
                            
                            self.status = true
                            self.showModal = false
                            
                        }
    }
    
    
    
    public func createAccount() {
        
        //self.showModal = false
        print(emailSignUp)
        
    }
    
    // log Out...
    
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
    }
    
}
