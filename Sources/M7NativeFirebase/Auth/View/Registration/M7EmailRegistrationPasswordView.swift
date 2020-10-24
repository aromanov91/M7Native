//
//  File.swift
//  
//
//  Created by 18391981 on 27.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailRegistrationPasswordView: View {
    
    @EnvironmentObject public var model: M7AuthFlowViewModel
    
    public var body: some View {
        
        
        
        M7ModalNavigationView(M7Localize.auth.createAccounTitle) {
            
            
            
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: M7Space.m) {
                    
                    M7TextField(M7Localize.auth.passwordTextField, text: $model.passwordSignUp)
                    
                }
                
                Spacer()
                
                M7Button(style: .primary, action: { model.signUp() }) {
                    M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
                }
                
                
            }.padding(.all, M7Space.m)
        }
        
        NavigationLink(destination: M7ApperanceView(), tag: 12, selection: $model.navigationLink) {
        EmptyView()
            
        }
    }
    
    
    
}

struct M7EmailRegistrationPasswordEnterStepView_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistrationPasswordView()
    }
}

