//
//  M7MessengerTextFieldView.swift
//  Listixs (iOS)
//
//  Created by Alexander Romanov on 01.10.2020.
//

import SwiftUI

public struct M7MessengerTextFieldView: View {
    
    @Binding public var text: String
    @State public var focused: Bool = true
    
    public let sendAction: () -> Void
    
    public init(text: Binding<String>, sendAction: @escaping () -> Void) {
        self._text = text
        self.sendAction = sendAction
    }
    
    public var body: some View {

        HStack(alignment: .top) {
            
            ZStack {
                
                //M7BlurView(.light)
                
                VStack {
                    
                    HStack(spacing: M7Space.xSmall) {
                        
                    
                        
                        Button(action: sendAction ) {
                            M7Icon(.camera)
                        }
                        
                        TextField("New message", text:  $text)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .cornerRadius(16)
                        
                        if text.count > 0 {
                        
                        Button(action: sendAction ) {
                            M7Icon(.arrowUp, color: .onPrimaryHighEmphasis)
                        }.frame(width: 28, height: 28)
                        .background(M7Color.primary.color)
                        .cornerRadius(10)
                       
                        
                        }
                    }.frame(height: 40)
                    .padding(.leading, 12)
                    .padding(.trailing, 8)
                    //.background(M7BlurView())
                    .background(M7Color.onBackgroundHighEmphasis.color.opacity(0.07))
                    .cornerRadius(14)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, M7Space.xSmall)
                .padding(.vertical, M7Space.xxSmall)

            }
        }
        //.background(M7Color.backgroundSecondary.color)
        .background( M7BlurView())
        .padding(.all, 0)
        .frame(minWidth: 0, maxWidth: .infinity)

    }
}

