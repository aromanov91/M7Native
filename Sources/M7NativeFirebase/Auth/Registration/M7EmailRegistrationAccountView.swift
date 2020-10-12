//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 29.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailRegistrationAccountView: View {
    
    var email = ""
    var password = ""
    
    @State var firstName = ""
    
    @State var lasttName = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        
        M7ModalNavigationView {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                
                M7Button(style: .secondary, size: .m, round: .full, width: .round,
                         action: { self.presentationMode.wrappedValue.dismiss() }) {
                    M7Icon(.arrowLeft)
                }
                
                M7Text(M7Localize.auth.createAccounTitle, style: .title1)
                
                M7TextField(M7Localize.auth.firstNameTextField, text: $firstName)
                
                M7TextField(M7Localize.auth.lasttNameTextField, text: $lasttName)
                
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { print("") }) {
                M7Text(M7Localize.auth.createAccountButton, style: .button, color: .onPrimaryHighEmphasis)
            }
            
            
        }.padding(.all)
    }
    }
    
    
}

struct M7EmailRegistrationNameEnterStepView_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistrationAccountView()
    }
}

