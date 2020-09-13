//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 13.09.2020.
//

import SwiftUI

public enum M7IconNames: String, CaseIterable {
    case menu = "menu"
    case send = "send"
}

public enum M7IconSizes: Int, CaseIterable {
    case s
    case m
    case l
}

public struct M7Icon: View {
    
    private struct Constants {
        
        /// Size
        static var s: CGFloat = M7Space.s
        static var m: CGFloat = M7Space.m
        static var l: CGFloat = M7Space.l
        
    }
    
    let name: M7IconNames
    var frameSize: CGFloat = Constants.m
    
    
    
    public init(name: M7IconNames = .menu, size: M7IconSizes = .m) {
        self.name = name
       
        self.setTextStyle(size)
    }
    
    public var body: some View {
        Image(name.rawValue)
            .resizable()
            .frame(width: frameSize, height: frameSize)
    }
    
    private mutating func setTextStyle(_ size: M7IconSizes) {
        switch size {
        case .m:
            break
        case .s:
            self.frameSize = Constants.s
        case .l:
            self.frameSize = Constants.l
        }
    }
}
