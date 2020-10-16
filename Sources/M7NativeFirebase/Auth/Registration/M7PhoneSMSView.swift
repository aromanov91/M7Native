//
//  M7PhoneRegistrationView.swift
//
//
//  Created by Alexander Romanov on 12.10.2020.
//

import SwiftUI
import M7Native

public struct M7PhoneSMSView: View {
    
    public init() {}
    
    @EnvironmentObject public var model: M7AuthModel
    
    public var body: some View {
        
        
        
        M7ModalNavigationView(/*M7Localize.auth.createAccounTitle*/ "SMS" ) {
            
            
            
            VStack {
                
                VStack(alignment: .leading, spacing: M7Space.m) {
                    
                 
                    
                    M7SMSField($model.smsCode)
                    
                }
                
                Spacer()
                
                M7Button(style: .primary, action: { model.chekSMS() }) {
                    M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
                }
                
                NavigationLink(destination: M7EmailRegistrationAccountView().environmentObject(model), tag: 88, selection: $model.navigationLinkCreateAccount) {
                    EmptyView()
                }

            }.padding(.all, M7Space.m)
            
        }
    }
    
}

//struct M7PhoneRegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        M7PhoneRegistrationView()
//    }
//}
