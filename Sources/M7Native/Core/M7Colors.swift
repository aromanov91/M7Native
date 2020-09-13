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
        return Color("Primary")
    }
    
    /// On Primary
    public enum onPrimary {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnPrimaryHighEmphasis")
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnPrimaryMediumEmphasis")
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnPrimaryDisabled")
        }
    }
//    
    /// Background
    public enum background {
        
        /// High Emphasis
        public static var primary: Color {
            return Color("BackgroundPrimary")
        }
        
        /// Medium Emphasis
        public static var secondary: Color {
            return Color("BackgroundSecondary")
        }

        /// Disabled
        public static var tertiary: Color {
            return Color("BackgroundTertiary")
        }
    }
    
    /// On Background
    public enum onBackground {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnBackgroundHighEmphasis")
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnBackgroundMediumEmphasis")
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnBackgroundDisabled")
        }
    }

    /// Surface
    public enum surface {
        
        /// High Emphasis
        public static var primary: Color {
            return Color("SurfacePrimary")
        }
        
        /// Medium Emphasis
        public static var secondary: Color {
            return Color("SurfaceSecondary")
        }
        
        /// Disabled
        public static var tertiary: Color {
            return Color("SurfaceTertiary")
        }
    }
    
    /// On Surface
    public enum onSurface {
        
        /// High Emphasis
        public static var highEmphasis: Color {
            return Color("OnSurfaceHighEmphasis")
        }
        
        /// Medium Emphasis
        public static var mediumEmphasis: Color {
            return Color("OnSurfaceMediumEmphasis")
        }
        
        /// Disabled
        public static var disabled: Color {
            return Color("OnSurfaceDisabled")
        }
    }
    
    /// Error
    public static var error: Color {
        return Color("Error")
    }
    
    /// Success
    public static var success: Color {
        return Color("Success")
    }
    
    /// Warning
    public static var warning: Color {
        return Color("Warning")
    }
    
    
    /// Link
    public static var link: Color {
        return Color("Primary")
    }
}
