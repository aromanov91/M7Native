//
//  M7TextField.swift
//
//  Created by Alexander Romanov on 07.06.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import Combine

public enum M7TextFieldHelperStyle {
    case none
    case helperText
    case errorText
    case sussesText
}

public struct M7TextField: View {
    
    public var placeholder: String
    @Binding public var text: String
    @Binding public var helperText: String
    @Binding public var helperStyle: M7TextFieldHelperStyle
    
    //    public var leadingImage: String
    //    public var trallingImage: String
    
    public var leadingImage: M7IconNames
    public var trallingImage: M7IconNames
    
    public var secure: Bool = false
    @State private var focused: Bool = false
    
    //    public init(_ placeholder: String,
    //                text: Binding<String>,
    //                helperText: Binding<String> = .constant(""),
    //                helperStyle: Binding<M7TextFieldHelperStyle> = .constant(.none),
    //                leadingImage: String = "",
    //                trallingImage: String = "") {
    //        self.placeholder = placeholder
    //        self._text = text
    //        self._helperText = helperText
    //        self._helperStyle = helperStyle
    //        self.leadingImage = leadingImage
    //        self.trallingImage = trallingImage
    //    }
    
    public init(_ placeholder: String,
                text: Binding<String>,
                helperText: Binding<String> = .constant(""),
                helperStyle: Binding<M7TextFieldHelperStyle> = .constant(.none),
                leadingImage: M7IconNames = .none,
                trallingImage: M7IconNames = .none) {
        self.placeholder = placeholder
        self._text = text
        self._helperText = helperText
        self._helperStyle = helperStyle
        self.leadingImage = leadingImage
        self.trallingImage = trallingImage
    }
    
    public var body: some View {
        
        VStack {
            HStack {
                M7Text(placeholder, style: .subtitle2)
                Spacer()
            }
            
            VStack {
                
                HStack {
                    
                    if leadingImage != .none {
                        M7Icon(leadingImage)
                    }
                    
                    if secure {
                        SecureField("", text: $text)
                    } else {
                        
                        TextField("", text: $text, onEditingChanged: { focused in
                            self.focused = focused
                        })
                    }
                    
                    if trallingImage != .none {
                        M7Icon(trallingImage)
                    }
                    
                    if helperStyle == .errorText {
                        Image("alert-circle").renderingMode(.template).foregroundColor(M7Colors.error).frame(width: 20, height: 20)
                    }
                    
                    if helperStyle == .sussesText {
                        Image("check").renderingMode(.template).foregroundColor(M7Colors.success).frame(width: 20, height: 20)
                        
                    }
                    
                }
                
            }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(focused ? M7Colors.primary : M7Colors.surface.primary, lineWidth: 4)
                
                
            ).background(RoundedRectangle(cornerRadius: 12).fill(focused ? M7Colors.surface.primary : M7Colors.surface.secondary))
            .cornerRadius(M7Radius.m)
            .font(M7Fonts.subtitle1)
            
            if helperText != "" {
                
                HStack {
                    
                    if helperStyle == .helperText {
                        M7Text(helperText, style: .subtitle2).foregroundColor(M7Colors.onSurface.mediumEmphasis)
                    } else if helperStyle == .errorText {
                        M7Text(helperText, style: .subtitle2).foregroundColor(M7Colors.error)
                    } else if helperStyle == .sussesText {
                        M7Text(helperText, style: .subtitle2).foregroundColor(M7Colors.success)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
