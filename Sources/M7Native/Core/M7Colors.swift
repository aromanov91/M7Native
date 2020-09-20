//
//  M7Fonts.swift
//  DSOneDemo
//
//  Created by Alexander Romanov on 16.05.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public class M7Colors {
    
    /// Primary
    public static var primary: Color {
        let colorSetting = AccentColorSetting()
        let colors: [AccentColor] = accentColorsData
        return colors[colorSetting.accentColorSetting].themeColor
    }
    
    /// On Primary
    public enum onPrimary {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnPrimaryHighEmphasis", bundle: .module)
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnPrimaryMediumEmphasis", bundle: .module)
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnPrimaryDisabled", bundle: .module)
        }
    }
    //
    /// Background
    public enum background {
        
        /// High Emphasis
        public static var primary: Color {
            return Color("BackgroundPrimary", bundle: .module)
        }
        
        /// Medium Emphasis
        public static var secondary: Color {
            return Color("BackgroundSecondary", bundle: .module)
        }
        
        /// Disabled
        public static var tertiary: Color {
            return Color("BackgroundTertiary", bundle: .module)
        }
    }
    
    /// On Background
    public enum onBackground {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnBackgroundHighEmphasis", bundle: .module)
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnBackgroundMediumEmphasis", bundle: .module)
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnBackgroundDisabled", bundle: .module)
        }
    }
    
    /// Surface
    public enum surface {
        
        /// High Emphasis
        public static var primary: Color {
            return Color("SurfacePrimary", bundle: .module)
        }
        
        /// Medium Emphasis
        public static var secondary: Color {
            return Color("SurfaceSecondary", bundle: .module)
        }
        
        /// Disabled
        public static var tertiary: Color {
            return Color("SurfaceTertiary", bundle: .module)
        }
    }
    
    /// On Surface
    public enum onSurface {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnSurfaceHighEmphasis", bundle: .module)
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnSurfaceMediumEmphasis", bundle: .module)
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnSurfaceDisabled", bundle: .module)
        }
    }
    
    /// Error
    public static var error: Color {
        return Color("Error", bundle: .module)
    }
    
    /// Success
    public static var success: Color {
        return Color("Success", bundle: .module)
    }
    
    /// Warning
    public static var warning: Color {
        return Color("Warning", bundle: .module)
    }
    
    
    /// Link
    public static var link: Color {
        return Color("Primary", bundle: .module)
    }
}

public enum M7Color {
    case primary
    case onPrimaryHighEmphasis
    case onPrimaryMediumEmphasis
    case onPrimaryDisabled
    case backgroundPrimary
    case backgroundSecondary
    case backgroundTertiary
    case onBackgroundHighEmphasis
    case onBackgroundMediumEmphasis
    case onBackgroundDisabled
    case surfacePrimary
    case surfaceSecondary
    case surfaceTertiary
    case onSurfaceHighEmphasis
    case onSurfaceMediumEmphasis
    case onSurfaceDisabled
    case error
    case success
    case warning
    
    public var color: Color {
        switch self {
        case .primary: return M7Colors.primary
        case .onPrimaryHighEmphasis: return M7Colors.onPrimary.highEmphasis
        case .onPrimaryMediumEmphasis: return M7Colors.onPrimary.mediumEmphasis
        case .onPrimaryDisabled: return M7Colors.onPrimary.disabled
        case .backgroundPrimary: return M7Colors.background.primary
        case .backgroundSecondary: return M7Colors.background.secondary
        case .backgroundTertiary: return M7Colors.background.tertiary
        case .onBackgroundHighEmphasis: return M7Colors.onBackground.highEmphasis
        case .onBackgroundMediumEmphasis: return M7Colors.onBackground.mediumEmphasis
        case .onBackgroundDisabled: return M7Colors.onBackground.disabled
        case .surfacePrimary: return M7Colors.surface.primary
        case .surfaceSecondary: return M7Colors.surface.secondary
        case .surfaceTertiary: return M7Colors.surface.tertiary
        case .onSurfaceHighEmphasis: return M7Colors.onSurface.highEmphasis
        case .onSurfaceMediumEmphasis: return M7Colors.onSurface.mediumEmphasis
        case .onSurfaceDisabled: return M7Colors.onSurface.disabled
        case .error: return M7Colors.error
        case .success: return M7Colors.success
        case .warning: return M7Colors.warning
            
        }
    }
}
