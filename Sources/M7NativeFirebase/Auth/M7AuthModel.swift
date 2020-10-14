//
//  File.swift
//  
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

public class M7AuthModel : ObservableObject {
    
    public init() {}
    
    // Navigation
    //@Published public var showModal = false
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
    
    // Form
    @Published public var firstName = ""
    @Published public var lastName = ""
    
    
    
    // Loading
    
    @Published public var isLoading = false
    
    public func emailCheck() {
        navigationLink = 1
    }
    
    public func signUp() {
        
        navigationLink = 2
//
//        self.isEmailError = false
//
//        if passwordSignUp == "" {
//
//            self.errorText = "Fill contents proprely!!!"
//            self.isEmailError = true
//            return
//        }
//
//        withAnimation{
//
//            self.isLoading.toggle()
//        }
//
//        Auth.auth().createUser(withEmail: emailSignUp, password: passwordSignUp) { (result, err) in
//
//            withAnimation{
//
//                self.isLoading.toggle()
//            }
//
//            if err != nil{
//                self.errorText = err!.localizedDescription
//                self.isEmailError = true
//                return
//            }
//
//            // sending Verifcation Link....
//
//            result?.user.sendEmailVerification(completion: { (err) in
//
//                if err != nil{
//                    self.errorText = err!.localizedDescription
//                    self.isEmailError = true
//                    return
//                }
//
//                // Alerting User To Verify Email...
//
//                self.errorText = "Email Verification Has Been Sent !!! Verify Your Email ID !!!"
//
//            })
//        }
    }
    
    public func createAccount() {
        
        //self.showModal = false
        print(emailSignUp)
        //print(showModal)
        
    }
    
    // log Out...
    
    public func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            
            // self.status = false
        }
        
        // clearing all data...
        
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
    }
    
}
