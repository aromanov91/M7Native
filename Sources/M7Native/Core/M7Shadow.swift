//
//  M7Shadow.swift
//  DSOneDemo
//
//  Created by Alexander Romanov on 31.05.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

public class M7Shadow {
    
    public class shadowCreate {
        var color: Color
        var opacity: Double
        var radius: CGFloat
        var x: CGFloat
        var y: CGFloat
        
        public init(color: Color, opacity: Double, radius: CGFloat, x: CGFloat, y: CGFloat) {
            self.color = color
            self.opacity = opacity
            self.radius = radius
            self.x = x
            self.y = y
        }
    }
    
    public static var z0 = shadowCreate(color: Color.clear, opacity: 0, radius: 0, x: 0, y: 0)
    public static var z1 = shadowCreate(color: Color.black, opacity: 0.08, radius: 8, x: 0, y: 2)
    public static var z2 = shadowCreate(color: Color.black, opacity: 0.08, radius: 16, x: 0, y: 4)
    public static var z3 = shadowCreate(color: Color.black, opacity: 0.12, radius: 24, x: 0, y: 8)
    public static var z4 = shadowCreate(color: Color.black, opacity: 0.16, radius: 34, x: 0, y: 12)
}
