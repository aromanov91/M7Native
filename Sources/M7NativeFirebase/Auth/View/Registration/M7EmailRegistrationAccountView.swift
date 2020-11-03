//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 29.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailRegistrationAccountView: View {
    
    @EnvironmentObject var model: M7AuthFlowViewModel
    
    public var body: some View {
        
        M7ModalNavigationView(M7Localize.auth.createAccounTitle) {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: M7Space.medium) {
                    
                    M7TextField(M7Localize.auth.firstNameTextField, text: $model.firstName)
                    
                }
                
                Spacer()
                
                M7Button(style: .primary, action: { model.createAccount() }) {
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

