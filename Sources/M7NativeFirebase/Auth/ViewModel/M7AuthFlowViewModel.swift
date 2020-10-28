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
import Combine

public class M7AuthFlowViewModel: ObservableObject {
    
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
    @Published public var phoneErrorText = ""
    @Published public var smsErrorText = ""
    @Published public var isSmsError = false
    @Published public var isPhoneError = false
    
    // Form
    @Published public var username = "Anonimus"
    @Published public var firstName = ""
    @Published public var lastName = ""
    @Published public var pic = ""
    @Published public var bio = ""
    
    
    @Published public var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        self.authenticationService.objectWillChange
            .sink { _ in
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    
    
    public func emailCheck() {
        navigationLink = 1
    }
    
    public func signUp() {
        
        navigationLink = 2
        
    }
    
    public func sendAuthSMS() {
        
        isLoading = true
        isPhoneError = false
        
        authenticationService.sendAuthSMS(phoneNumber: phoneNumber) { (result) in
            
            switch result {
            
            case .success(_):
                self.isLoading = false
                self.navigationLink = 1
                print(".navigationLink = 1")
                
            case .failure(let error):
                self.isLoading = false
                self.isPhoneError = true
                self.phoneErrorText = error.localizedDescription
                print("phoneErrorText")
            }
        }
    }
    
    public func chekSMS() {
        
        isLoading = true
        isSmsError = false
        
        authenticationService.chekSMS(smsCode: smsCode) { (result) in
            
            switch result {
            
            case .success(_):
                print("ChekSMS VM Susses")
                self.isLoading = false
                self.showModal = false
                
//                self.authenticationService.isUserDataCreated { (dataResult) in
//                    
//                    switch dataResult {
//                    
//                    case .success(let data):
//                        if data {
//                            print("Close Modal")
//                            
//                            self.showModal = false
//                            
//                            
//                        } else {
//                            print("Navogate to CreateAccount ")
//                            
//                            self.navigationLinkCreateAccount = 88
//                            
//                        }
//                    case .failure(let error):
//                        self.isLoading = false
//                        self.errorText = error.localizedDescription
//                        print("ChekSMS VM UserData Error: \(error.localizedDescription)")
//                    }
//                }
                
                
                
            case .failure(let error):
                self.isLoading = false
                self.isSmsError = true
                self.smsErrorText = error.localizedDescription
                print("ChekSMS VM Error: \(error.localizedDescription)")
            }
        }
    }
    
    public func createAccount() {
        
        isLoading = true
        
        authenticationService.changeDisplayName(displayName: firstName) { (result) in
            
            switch result {
            
            case .success(let user):
                print("✅ Set display name: \(String(describing: user.displayName))")
                
                self.authenticationService.createAccount(UserData(username: self.username, pic: self.pic, bio: self.bio)) { (result) in
                    
                    self.isLoading = false
                    
                    switch result {
                    
                    case .success(_):
                        self.isLoading = false
                        self.showModal = false
                        
                    case .failure(let error):
                        self.isLoading = false
                        self.errorText = error.localizedDescription
                    }
                    
                }
                
                
            case .failure(let error):
                self.isLoading = false
                self.errorText = error.localizedDescription
                print("ChekSMS VM Error")
            }
            
        }
        
    }
    
    
    
    public func logOut(){
        
        authenticationService.logOut()
        
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
        navigationLink = 0
        navigationLinkCreateAccount = 0
        errorText = ""
        smsCode = ""
    }
}
