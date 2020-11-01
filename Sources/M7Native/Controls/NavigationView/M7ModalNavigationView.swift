//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 11.10.2020.
//

import SwiftUI

public struct M7ModalNavigationView<Content>: View where Content: View {
    
    public let content: () -> Content
    @Environment(\.presentationMode) var presentationMode
    
    public let title: String
    
    @Binding var showTitle: Bool
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: .zero) {
            
            HStack {
                
                VStack(alignment: .leading, spacing: M7Space.s) {
                    
                    HStack {
                        
                        M7Button(style: .secondary, size: .m, round: .full, width: .round, action: { self.presentationMode.wrappedValue.dismiss() }) {
                            M7Icon(.arrowLeft)
                        }
                        
                        if self.showTitle == false {
                            
                            M7Text(title, style: .title3)
                            
                        }
                        
                    }
                    
                    if self.showTitle {
                        
                        M7Text(title, style: .title1)
                        
                    }
                    
                    
                }.padding(.all, M7Space.m)
                
                Spacer()
                
            }
            
            .background(M7BlurView())
            
            
            content()
                .navigationBarHidden(true)
            
        }
    }
    
    
    public init(_ title: String = "", showTitle: Binding<Bool> = .constant(true), @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self._showTitle = showTitle
        self.content = content
    }
}


//public struct M7NavigationView<Content>: View where Content: View {
//
//    public let content: () -> Content
//    @Environment(\.presentationMode) var presentationMode
//
//    public let title: String
//
//    public var btnBack : some View {
//
//            M7Button(style: .secondary, size: .m, round: .full, width: .round,
//                     action: { presentationMode.wrappedValue.dismiss() }) {
//                M7Icon(.arrowLeft)
//            }.frame(width: 44)
//            .offset(y: 8)
//
//
//    }
//
//    public var body: some View {
//        content()
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: btnBack)
//            .navigationBarTitle(LocalizedStringKey(title))
//    }
//
//    public init(_ title: String = "", @ViewBuilder content: @escaping () -> Content) {
//        self.title = title
//        self.content = content
//    }
//}
