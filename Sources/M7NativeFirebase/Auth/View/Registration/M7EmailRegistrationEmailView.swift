//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 27.09.2020.
//

import SwiftUI
import M7Native

public struct M7EmailRegistrationEmailView: View {
    
    @EnvironmentObject public var model: M7AuthFlowViewModel

    public var body: some View {
        
        NavigationLink(destination: M7EmailRegistrationPasswordView().environmentObject(model), tag: 11, selection: $model.navigationLink ) {
            EmptyView()
        }
        
        M7ModalNavigationView(M7Localize.auth.createAccounTitle) {
            
            VStack {
                
                VStack(alignment: .leading, spacing: M7Space.m) {
                    
                    M7TextField(M7Localize.auth.emailTextField, text: $model.emailSignUp)
                }
                
                Spacer()
                
                M7Button(style: .primary, action: { model.emailCheck() }) {
                    M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
                }
                
            }.padding(.all, M7Space.m)
        }
    }
}

struct M7EmailRegistration_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistrationEmailView()
    }
}
