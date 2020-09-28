//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 27.09.2020.
//

import SwiftUI

public struct M7EmailRegistrationEmailEnterStepView: View {
    
    @State var email = ""
    
    @State private var navigationLink: Int? = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        
        NavigationLink(destination: M7EmailRegistrationPasswordEnterStepView(email: email), tag: 1, selection: $navigationLink) {
            EmptyView()
        }
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                
                M7Button(style: .secondary, size: .m, round: .full, width: .round,
                         action: { self.presentationMode.wrappedValue.dismiss() }) {
                    M7Icon(.arrowLeft)
                }
                
                M7Text(M7Localize.auth.createAccounTitle, style: .title1)
                
                M7TextField(M7Localize.auth.emailTextField, text: $email)
                
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { navigationLink = 1 }) {
                Text(LocalizedStringKey(M7Localize.button.next), bundle: .module)
            }
            
            
        }.padding(.all, M7Space.m)
            .navigationBarHidden(true)
            
    }
    
  
}

struct M7EmailRegistration_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistrationEmailEnterStepView()
    }
}
