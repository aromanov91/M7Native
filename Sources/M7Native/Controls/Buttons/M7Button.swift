//
//  DSButton.swift
//  DSOne
//
//  Created by Alexander Romanov on 13.05.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public enum M7ButtonStyle: Int, CaseIterable {
    case primary
    case secondary
    case gray
    case link
    case deleteLink
}

public enum M7ButtonRounded {
    case full
    case m
    case s
    case none
}

public enum M7ButtonSize {
    case l
    case m
}

public enum M7ButtonWidth {
    case full
    case round
}


public struct M7Button<Content: View>: View {
    
    let action: () -> Void
    let content: Content
    
    private struct Constants {
        
         /// Size
        static var heightL: CGFloat { return M7Space.xl + M7Space.xxs }
        static var heightM: CGFloat { return M7Space.l + M7Space.xxs }
        
        /// Radius
        static var radiusM: CGFloat { return M7Radius.m }
        static var radiusS: CGFloat { return M7Radius.s }
        
        /// Shadow
        static var shadowClean: M7Shadow.shadowCreate { return M7Shadow.z0 }
        static var shadowDefault: M7Shadow.shadowCreate { return M7Shadow.z2 }
        static var shadowTap: M7Shadow.shadowCreate { return M7Shadow.z1 }
        static var primaryShadow: M7Shadow.shadowCreate {
            return M7Shadow.shadowCreate(color: M7Colors.primary, opacity: 0.5, radius: 12, x: 0, y: 12)
        }
        
        /// Font
        static var font: Font { return M7Fonts.button }
        
    }
    
    public var backgroundColor: Color = Color.clear
    
    public var labelColor = Color.black
    
    public var style: M7ButtonStyle
    
    public var isShadow: Bool
    
    public var shadowStyle = M7Shadow.z0
    
    public var size: M7ButtonSize
    
    public var round: M7ButtonRounded
    
    public var height: CGFloat = 0
    
    public var radius: CGFloat = 0
    
    private var widthType: M7ButtonWidth
    
    @State private var isPressed: Bool = false
    
    public init(style: M7ButtonStyle = .secondary, size: M7ButtonSize = .l, round: M7ButtonRounded = .m, shadow: Bool = true, width: M7ButtonWidth = .full, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
        self.style = style
        self.size = size
        self.round = round
        self.isShadow = shadow
        self.widthType = width

        setButtonStyle(style)
        setShadow(shadow)
        setSize(size)
        setRounded(round)
    }
    
    public var body: some View {
        
        Button(action: action) {

            content
                .frame(minWidth: 0, maxWidth: widthType == .full ? .infinity : size == .l ? Constants.heightL : Constants.heightM)
                .frame(height: height)
                .background(backgroundColor)
                .cornerRadius(radius)
                .foregroundColor(labelColor)
                .shadow(color: shadowStyle.color.opacity(shadowStyle.opacity) ,
                        radius: shadowStyle.radius,
                        x: shadowStyle.x,
                        y: shadowStyle.y)

                .font(Constants.font)
                .scaleEffect(self.isPressed ? 0.90 : 1.0)
       
//            .gesture(DragGesture(minimumDistance: 0.0)
//            .onChanged { _ in self.isPressed = true }
//            .onEnded { _ in self.isPressed = false })
        }
    }
    
    private mutating func setButtonStyle(_ style: M7ButtonStyle) {
        
        switch style {
        case .primary:
            backgroundColor = M7Colors.primary
            labelColor = M7Colors.onPrimary.highEmphasis
            
            
        case .secondary:
            backgroundColor = M7Colors.surface.primary
            labelColor = M7Colors.onSurface.highEmphasis
            
            
        case .gray:
            backgroundColor = M7Colors.background.secondary
            labelColor = M7Colors.onBackground.highEmphasis
            
            
        case .link:
            labelColor = M7Colors.primary
            
            
        case .deleteLink:
            labelColor = M7Colors.error
            
        }
    }
    
    private mutating func setShadow(_ shadow: Bool) {
        
        if shadow {
            
            if style == .primary {
                shadowStyle = Constants.primaryShadow
            } else {
                shadowStyle = Constants.shadowDefault
            }
            
        } else {
            shadowStyle = Constants.shadowClean
        }
    }
    
    private mutating func setSize(_ size: M7ButtonSize) {
        
        switch size {
        case .l:
            self.height = Constants.heightL
        case .m:
            self.height = Constants.heightM
        }
    }
    
    private mutating func setRounded(_ radius: M7ButtonRounded) {
        
        switch radius {
        case .full:
            
            switch size {
            case .l:
                self.radius = Constants.heightL / 2
            case .m:
                self.radius = Constants.heightM / 2
            }
            
        case .m:
             self.radius = Constants.radiusM
        case .s:
            self.radius = Constants.radiusS
        case .none:
            self.radius = 0
        }
    }
}

