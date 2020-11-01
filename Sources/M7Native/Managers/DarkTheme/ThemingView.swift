//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 19.09.2020.
//

import SwiftUI


public enum M7Theme: Int, CaseIterable {
    case system
    case dark
    case light
}

public class M7ThemeColorSetting: ObservableObject {
    @Published var themeSetting: String = UserDefaults.standard.string(forKey: "Settings.Apperance.Theme") ?? "system" {
        didSet {
            UserDefaults.standard.set(self.themeSetting, forKey: "Settings.Apperance.Theme")
        }
    }
}


//.colorScheme(.dark)
public struct M7ThemingView<Content: View>: View {
    
    @ObservedObject var theme = M7ThemeColorSetting()
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        
        self.content = content()
    }
    
    public var body: some View {
        
        containedView()
        
    }
    
    private func containedView() -> AnyView {
        
        switch self.theme.themeSetting {
        
        case "system":
            return AnyView( self.content )
            
        case "dark":
            return AnyView(
                self.content
                    .colorScheme(.dark)
            )
            
        case "light":
            return AnyView(
                self.content
                    .colorScheme(.light)
            )
            
        default: return AnyView( self.content )
        }
        
    }
}
