//
//  File.swift
//  
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

public class AuthModel : ObservableObject {
    
    @Published var showModal = false
    
    // Email
    @Published var email = ""
    @Published var password = ""
    
    @Published var emailSignUp = ""
    @Published var passwordSignUp = ""
    
    @Published var isEmailError = false
    @Published var errorText = ""
    // @Published var isLinkSend = false
    // @Published var isSignUp = false
    
    // SMS
    @Published var smsCode = ""
    @Published var phoneNumber = ""
    @Published var smsErrorText = ""
    @Published var isSmsError = false
    
    // Loading
    
    @Published var isLoading = false
    
    func signUp(){
    
        self.isEmailError = false
        
        if passwordSignUp == ""{
            
            self.errorText = "Fill contents proprely!!!"
            self.isEmailError = true
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: emailSignUp, password: passwordSignUp) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                self.errorText = err!.localizedDescription
                self.isEmailError = true
                return
            }
            
            // sending Verifcation Link....
            
            result?.user.sendEmailVerification(completion: { (err) in
                
                if err != nil{
                    self.errorText = err!.localizedDescription
                    self.isEmailError = true
                    return
                }
                
                // Alerting User To Verify Email...
                
                self.errorText = "Email Verification Has Been Sent !!! Verify Your Email ID !!!"
                
            })
        }
    }
    
    // log Out...
    
    func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            
            // self.status = false
        }
        
        // clearing all data...
        
        email = ""
        password = ""
        emailSignUp = ""
        passwordSignUp = ""
        reEnterPassword = ""
    }
    
}
