//
//  M7Surface.swift
//  DSOne
//
//  Created by Alexander Romanov on 14.05.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public enum M7SurfaceElevation: Int, CaseIterable {
    case z0
    case z1
    case z2
    case z3
    case z4
}

public enum M7SurfaceColor: Int, CaseIterable {
    case primary
    case secondary
    case tertiary
}

public enum M7SurfacePadding: Int, CaseIterable {
    case xxxs
    case xxs
    case m
    case s
    case zero
}

public enum M7SurfaceRadius: Int, CaseIterable {
    case zero
    case m
    case s
}


@available(iOS 13.0, macOS 10.15, *)
public struct M7Surface<Content: View>: View {
    
    private struct Constants {
        
        /// Colors
        static var colorPrimary: Color { return M7Colors.surface.primary }
        static var colorSecondary: Color { return M7Colors.surface.secondary }
        static var colorTertiary: Color { return M7Colors.surface.tertiary }
        
        /// Size
        static var paddingM: CGFloat { return M7Paddings.all.medium }
        static var paddingS: CGFloat { return M7Paddings.all.small }
        static var paddingXXXS: CGFloat { return M7Paddings.all.xxxSmall }
        static var paddingXXS: CGFloat { return M7Paddings.all.xxSmall }
        static var paddingZero: CGFloat { return .zero }
        
        /// Radius
        static var radiusM: CGFloat { return M7Radius.medium }
        static var radiusS: CGFloat { return M7Radius.small }
        
        /// Shadow
        static var shadowZ0: M7Shadow.shadowCreate { return M7Shadow.z0 }
        static var shadowZ1: M7Shadow.shadowCreate { return M7Shadow.z1 }
        static var shadowZ2: M7Shadow.shadowCreate { return M7Shadow.z2 }
        static var shadowZ3: M7Shadow.shadowCreate { return M7Shadow.z3 }
        static var shadowZ4: M7Shadow.shadowCreate { return M7Shadow.z4 }
    }
    
    private let content: Content
    
    public var shadowStyle = Constants.shadowZ0
    
    public var backgroundColor: Color = Constants.colorPrimary
    
    public var radiusSize: CGFloat = Constants.radiusM
    
    public var background: M7SurfaceColor
    
    public var elevation: M7SurfaceElevation
    
    public var padding: M7SurfacePadding
    
    public var radius: M7SurfaceRadius
    
    public var paddingSize: CGFloat = 0
    
    public init(elevation: M7SurfaceElevation = .z0,
                background: M7SurfaceColor = .primary,
                padding: M7SurfacePadding = .m,
                radius: M7SurfaceRadius = .m,
                @ViewBuilder content: () -> Content) {
        
        self.content = content()
        self.elevation = elevation
        self.padding = padding
        self.background = background
        self.radius = radius
        
        self.setRadius(radius)
        self.setShadow(elevation)
        self.setBackground(background)
        self.setPadding(padding)
        
    }
    
    public var body: some View {
        
        self.content
            .padding(.all, paddingSize)
            .background(backgroundColor)
            .cornerRadius(radiusSize)
            .shadow(color: self.shadowStyle.color.opacity(self.shadowStyle.opacity),
                    radius: self.shadowStyle.radius,
                    x: self.shadowStyle.x,
                    y: self.shadowStyle.y)

    }
    
    private mutating func setRadius(_ radius: M7SurfaceRadius) {
        switch radius {
        case .zero:
            radiusSize = 0
        case .m:
            radiusSize = Constants.radiusM
        case .s:
            radiusSize = Constants.radiusS
        }
    }
    
    
    private mutating func setShadow(_ elevation: M7SurfaceElevation) {
        switch elevation {
        case .z0:
            self.shadowStyle = Constants.shadowZ0
        case .z1:
            self.shadowStyle = Constants.shadowZ1
        case .z2:
            self.shadowStyle = Constants.shadowZ2
        case .z3:
            self.shadowStyle = Constants.shadowZ3
        case .z4:
            self.shadowStyle = Constants.shadowZ4
        }
        
    }
    
    private mutating func setPadding(_ padding: M7SurfacePadding) {
        switch padding {
        case .xxxs:
            self.paddingSize = Constants.paddingXXXS
        case .xxs:
            self.paddingSize = Constants.paddingXXS
        case .m:
            self.paddingSize = Constants.paddingM
        case .s:
            self.paddingSize = Constants.paddingS
        case .zero:
            self.paddingSize = Constants.paddingZero
        }
    }
    
    private mutating func setBackground(_ background: M7SurfaceColor) {
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


struct DSSurface_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            M7Surface { HStack {
                Text("Text")
                Spacer()
            }}.previewLayout(.fixed(width: 414, height: 200))
            
            M7Surface { HStack {
                Text("Text")
                Spacer()
            }}.previewLayout(.fixed(width: 375, height: 200))
            
            M7Surface { HStack {
                Text("Text")
                Spacer()
            }}.previewLayout(.fixed(width: 320, height: 200))
        }
    }
}
