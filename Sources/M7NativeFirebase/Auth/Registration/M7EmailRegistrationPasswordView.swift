//
//  File.swift
//  
//
//  Created by 18391981 on 27.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailRegistrationPasswordView: View {
    
    var email = ""
    @State var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigationLink: Int? = 0
    
    public var body: some View {
        
        M7ModalNavigationView {
        
        NavigationLink(destination: M7EmailRegistrationAccountView(email: email, password: password), tag: 1, selection: $navigationLink) {
            EmptyView()
        }
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                
                M7Text(M7Localize.auth.createAccounTitle, style: .title1)
                
                M7TextField(M7Localize.auth.passwordTextField, text: $password)
                
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { navigationLink = 1 }) {
                M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
            }
            
            
        }.padding(.all, M7Space.m)
    }
    }
    
    
}

struct M7EmailRegistrationPasswordEnterStepView_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistrationPasswordView()
    }
}

