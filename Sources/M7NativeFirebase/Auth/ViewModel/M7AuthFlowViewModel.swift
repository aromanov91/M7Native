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
    
    public init() {}
    
    
    @Published var authenticationService = AuthenticationService()
    
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
    
    // Form
    @Published public var username = "Anonimus"
    @Published public var firstName = ""
    @Published public var lastName = ""
    @Published public var pic = ""
    @Published public var bio = ""
    
    
    @Published public var isLoading = false

    
    public func emailCheck() {
        navigationLink = 1
    }
    
    public func signUp() {
        
        navigationLink = 2
        
    }
    
    public func sendAuthSMS() {
        
        isLoading = true
        
        authenticationService.sendAuthSMS(phoneNumber: phoneNumber) { (result) in
            
            switch result {
            
            case .success(_):
                self.isLoading = false
                self.navigationLink = 1
                
            case .failure(let error):
                self.isLoading = false
                self.errorText = error.localizedDescription
            }
        }
    }
    
    public func chekSMS() {
        
        isLoading = true
        
        authenticationService.chekSMS(smsCode: smsCode) { (result) in
            
            switch result {
            
            case .success(_):
                
                print("ChekSMS VM Susses")
                self.isLoading = false
                
                self.authenticationService.isUserDataCreated { (data) in
                    
                    if data {
                        print("Close Modal")
                        self.showModal = false
                        
                        
                    } else {
                        print("Navogate to CreateAccount ")
                        self.navigationLinkCreateAccount = 88
                        
                    }
                    
                }
               
            case .failure(let error):
                self.isLoading = false
                self.errorText = error.localizedDescription
                print("ChekSMS VM Error")
            }
        }

    }
    
    public func createAccount() {
        
        isLoading = true
        
        authenticationService.createAccount(UserModel(username: username, firstName: firstName, lastName: lastName, pic: pic, bio: bio)) { (result) in
            
            switch result {
            
            case .success(_):
                self.isLoading = false
                self.showModal = false
                
            case .failure(let error):
                self.isLoading = false
                self.errorText = error.localizedDescription
            }
            
        }
        
    }
   
    
    
    public func logOut(){
        
        authenticationService.logOut()
        // clearing all data...
        
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
        
        navigationLink = 0
    }
    
}
