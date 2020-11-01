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
    
    @EnvironmentObject public var model: M7AuthFlowViewModel
    
    public var body: some View {
        
        
        
        M7ModalNavigationView(/*M7Localize.auth.createAccounTitle*/) {
            
            
            
            VStack {
                
                VStack(alignment: .center, spacing: M7Space.m) {
                    
                    Spacer()
                    
                    M7Text(M7Localize.auth.enterOTPTitle, style: .title3, alignment: .center)
                    
                    M7Text(M7Localize.auth.enterOTPSubtitle, style: .paragraph2, alignment: .center)
                    
                    M7SMSField($model.smsCode)
                        .padding(.vertical, M7Space.s)
                        .frame(width: 164)
                    
                    if model.isSmsError {
                        M7Text(model.smsErrorText, style: .subtitle2, color: .error, alignment: .center)
                    }
                    
                    Spacer()
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
