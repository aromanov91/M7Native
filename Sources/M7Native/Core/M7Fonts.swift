//
//  M7Fonts.swift
//  
//
//  Created by Alexander Romanov on 13.09.2020.
//

import SwiftUI

public class M7Fonts {
    
    public static var largeTitle: Font { return Font.system(size: 34, weight: .heavy) }
    
    public static var title1:     Font { return Font.system(size: 28, weight: .heavy) }
    
    public static var title2:     Font { return Font.system(size: 22, weight: .bold) }
    
    public static var title3:     Font { return Font.system(size: 20, weight: .bold) }
    
    public static var subtitle1:  Font { return Font.system(size: 16, weight: .semibold) }
    
    public static var subtitle2:  Font { return Font.system(size: 14, weight: .regular) }
    
    public static var paragraph1: Font { return Font.system(size: 16, weight: .regular) }
    
    public static var paragraph2: Font { return Font.system(size: 14, weight: .regular) }
    
    public static var caption:    Font { return Font.system(size: 12, weight: .medium) }
    
    public static var overline:   Font { return Font.system(size: 12, weight: .bold).lowercaseSmallCaps() }
    
    public static var button:     Font { return Font.system(size: 16, weight: .bold) }
}
