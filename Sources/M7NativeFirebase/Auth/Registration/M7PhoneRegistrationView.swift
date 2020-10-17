//
//  M7PhoneRegistrationView.swift
//
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import M7Native
import Firebase
import FirebaseAuth

public struct M7PhoneRegistrationView: View {
    
    public init() {}
    
   // @ObservedObject var model = M7AuthModel()
    
  
    
    @EnvironmentObject var model: M7AuthModel
    
    public var body: some View {
        
        NavigationView {
            

            //M7ModalNavigationView(/*M7Localize.auth.createAccounTitle*/ "Номер телефона" ) {
                
                
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: M7Space.m) {
                        
                        
                        
                        M7PhoneFiled($model.phoneNumber)
                        
                    }
                    
                    Spacer()
                    
                    M7Button(style: .primary, loader: $model.isLoading, action: {
                        
                       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                      
                        model.sendAuthSMS()
                        
                        
                        
                    }) {
                        M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
                    }
                    
                    NavigationLink(destination: M7PhoneSMSView().environmentObject(model), tag: 1, selection: $model.navigationLink) {
                                    EmptyView()
                                }
                                
                    
                }.padding(.all, M7Space.m)
                
            //}
        }
    }
    
}

struct M7PhoneRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        M7PhoneRegistrationView()
    }
}
