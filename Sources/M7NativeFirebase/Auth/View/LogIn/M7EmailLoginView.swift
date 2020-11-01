//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 27.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailLoginView: View {
    
    @State var email = ""
    
    @State var password = ""
    
    @State var show = false
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        
        M7ModalNavigationView(M7Localize.auth.signUpWithEmailTitle, showTitle: $show) {
        
            VStack(spacing: .zero) {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                

                List {
                    
                    
                M7TextField(M7Localize.auth.emailTextField, text: $email)
                    .onAppear {
                    
                    withAnimation {
                        
                        self.show = true
                    }
                    
                }
                .onDisappear {
                    
                    withAnimation {
                        
                        self.show = false
                    }
                }
                    
                    
                
                M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                    M7TextField(M7Localize.auth.passwordTextField, text: $password)
                
                }
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { print("") }) {
                M7Text(M7Localize.auth.logInButton, style: .button, color: .onPrimaryHighEmphasis)
            }
            }.padding(.horizontal, M7Space.m)
        
    }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailLoginView()
    }
}
