//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 27.09.2020.
//

import SwiftUI

public struct M7EmailRegistration: View {
    
    @State var email = ""
    
    public var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: M7Space.m) {
                
                M7Text(M7Localize.auth.createAccounTitle, style: .title1)
                
                M7TextField(M7Localize.auth.emailTextField, text: $email)
                
            }
            
            Spacer()
            
            M7Button(style: .primary, action: { print("") }) {
                Text(LocalizedStringKey(M7Localize.button.next), bundle: .module)
            }
            
            
        }.padding(.all, M7Space.m)
    }
    
  
}

struct M7EmailRegistration_Previews: PreviewProvider {
    static var previews: some View {
        M7EmailRegistration()
    }
}
