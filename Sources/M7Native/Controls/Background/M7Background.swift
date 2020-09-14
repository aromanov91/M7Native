//
//  M7Background.swift
//  DSOne
//
//  Created by Alexander Romanov on 07.06.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public enum M7BackgroundColor: Int, CaseIterable {
    case primary
    case secondary
    case tertiary
}

public enum M7BackgroundPadding: Int, CaseIterable {
    case m
    case s
}

public struct M7Background<Content: View>: View {
    
    private struct Constants {
        
        /// Colors
        static var colorPrimary: Color { return M7Colors.background.primary }
        static var colorSecondary: Color { return M7Colors.background.secondary }
        static var colorTertiary: Color { return M7Colors.background.tertiary }
        
        /// Size
        static var paddingM: CGFloat { return M7Paddings.all.m }
        static var paddingS: CGFloat { return M7Paddings.all.s }
        
        /// Radius
        static var radiusM: CGFloat { return M7Radius.m }
        static var radiusS: CGFloat { return M7Radius.s }
    }
    
    private let content: Content

    
    public var backgroundColor: Color = Constants.colorPrimary
    
    public var background: M7BackgroundColor
    
    public var padding: M7BackgroundPadding
    
    public var paddingSize: CGFloat = 0
    
    public init(background: M7BackgroundColor = .primary,
         padding: M7BackgroundPadding = .m,
         @ViewBuilder content: () -> Content) {
        
        self.content = content()
        self.padding = padding
        self.background = background

        self.setBackground(background)
        self.setPadding(padding)
    }
    
    public var body: some View {
        
        self.content
            .padding(.all, paddingSize)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(M7Radius.m)
        
    }
    
    private mutating func setPadding(_ padding: M7BackgroundPadding) {
        switch padding {
        case .m:
            self.paddingSize = Constants.paddingM
        case .s:
            self.paddingSize = Constants.paddingS
        }
    }
    
    private mutating func setBackground(_ background: M7BackgroundColor) {
        switch background {
        case .primary:
            self.backgroundColor = Constants.colorPrimary
        case .secondary:
            self.backgroundColor = Constants.colorSecondary
        case .tertiary:
            self.backgroundColor = Constants.colorTertiary
        }
    }
    
    //     geometry.size.width >= CGFloat(375) ? M7Paddings.all.m :  M7Paddings.all.s
    
}

