//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 25.09.2020.
//

import SwiftUI

struct M7AuthView: View {
    
    let registrationGoogleAction: () -> Void
    let secondaryAction: () -> Void
    let title: String
    let subtitle: String
    let image: Image
    
    @State private var navigationLink: Int? = 0
    
    public init(title: String,
                subtitle: String = "",
                image: Image = Image(""),
                registrationGoogleAction: @escaping () -> Void,
                secondaryAction: @escaping () -> Void = { }) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.registrationGoogleAction = registrationGoogleAction
        self.secondaryAction = secondaryAction
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer ()
                
                if image != Image("") {
                    
                    image
                        .scaledToFill()
                        .frame(maxHeight: 300)
                        .clipped()
                }
                
                Spacer ()
                
                VStack(spacing: M7Space.s) {
                    
                    M7Text(title, style: .title2, color: .onSurfaceHighEmphasis, alignment: .center)
                    
                    if subtitle != "" {
                        
                        M7Text(subtitle, style: .paragraph1, color: .onSurfaceHighEmphasis, alignment: .center)
                    }
                    
                    M7Button(style: .primary, action: { navigationLink = 1 }) {
                        Text(LocalizedStringKey(M7Localize.auth.signUpWithEmailButton), bundle: .module)
                    }
                    
                    M7Button(style: .secondary, action: registrationGoogleAction ) {
                        Text(LocalizedStringKey(M7Localize.auth.signUpWithGoogleButton), bundle: .module)
                    }
                    
                    M7Button(style: .link, action: { navigationLink = 2 }) {
                        Text(LocalizedStringKey(M7Localize.auth.logInButton), bundle: .module)
                    }
                    
                    NavigationLink(destination: M7EmailRegistration(), tag: 1, selection: $navigationLink) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: M7EmailLogin(), tag: 2, selection: $navigationLink) {
                        EmptyView()
                    }
                    
                }.padding(.horizontal, M7Space.m)
                
            }.navigationBarHidden(true)
            
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        M7AuthView(title: "Title", subtitle: "Subtitile", image: Image("empty", bundle: .module), registrationGoogleAction: { print(#function) })
    }
}