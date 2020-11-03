//
//  M7TitleAndButtonView.swift
//  
//
//  Created by Alexander Romanov on 15.09.2020.
//

import SwiftUI

public struct M7TitleAndButtonView: View {
    
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
    let title: String
    let subtitle: String
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let image: String
    let icon: M7IconNames
    
    private struct Constants {
        
        /// Size
        static var heightL: CGFloat { return M7Space.xLarge + M7Space.xxSmall }
        
    }
    
    public init(title: String,
                subtitle: String = "",
                image: String = "",
                icon: M7IconNames = .none,
                primaryButtonTitle: String = "",
                primaryAction: @escaping () -> Void) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.icon = icon
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryButtonTitle = ""
        self.primaryAction = primaryAction
        self.secondaryAction = { }
    }
    
    public init(title: String,
                subtitle: String = "",
                image: String = "",
                icon: M7IconNames = .none,
                primaryButtonTitle: String = "",
                secondaryButtonTitle: String = "",
                primaryAction: @escaping () -> Void,
                secondaryAction: @escaping () -> Void = { }) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.icon = icon
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryButtonTitle = secondaryButtonTitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
    
    public var body: some View {
        
        VStack(spacing: M7Space.medium) {
            
            if image != "" {
                Image(image)
            }
            
            if icon != .none {
                M7Icon(icon)
            }
            
            VStack(spacing: M7Space.xxSmall) {
            
                M7Text(title, style: .title2, color: .onSurfaceHighEmphasis, alignment: .center)
            
                if subtitle != "" {
                    
                    M7Text(subtitle, style: .paragraph1, color: .onSurfaceHighEmphasis, alignment: .center)
                }
            }
            
            if primaryButtonTitle != "" {
                
                M7Button(style: .primary, action: primaryAction) {
                    Text(primaryButtonTitle)
                }
            }
            
            if secondaryButtonTitle != "" {
                
                M7Button(style: .secondary ,action: secondaryAction) {
                    Text(secondaryButtonTitle)
                    
                }
            }
        }
    }
}

//struct TitleAndButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        TitleAndButtonView(title: "", primaryAction: print(""), secondaryAction: print(""))
////        TitleAndButtonView(title: "Title", subtitle: "Subtitle", image: "", icon: .airplay, primaryButtonTitle: "Primary", secondaryButtonTitle: "Secondary", primaryAction: print(#function), secondaryAction: print(#function))
//    }
//}

struct TitleAndButtonView_Previews: PreviewProvider {
    static var previews: some View {
        M7TitleAndButtonView(title: "Title", primaryAction: {} )
    }
}
