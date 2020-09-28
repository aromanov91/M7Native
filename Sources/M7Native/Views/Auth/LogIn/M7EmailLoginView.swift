//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 27.09.2020.
//

import SwiftUI

public struct M7EmailLoginView: View {
    
    @State var email = ""
    
    @State var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                
                M7Button(style: .secondary, size: .m, round: .full, width: .round, action: { self.presentationMode.wrappedValue.dismiss() }) {
                    M7Icon(.arrowLeft)
                }
                
                M7Text(M7Localize.auth.signUpWithEmailTitle, style: .title1)
                
                M7TextField(M7Localize.auth.emailTextField, text: $email)
                
                M7TextField(M7Localize.auth.passwordTextField, text: $password)
                
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { print("") }) {
                Text(LocalizedStringKey(M7Localize.auth.logInButton), bundle: .module)
            }
            
            
        }.padding(.all, M7Space.m)
        .navigationBarHidden(true)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailLoginView()
    }
}
