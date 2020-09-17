//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 16.09.2020.
//

import SwiftUI

public enum M7ListStyle: Int, CaseIterable {
    case defaultListStyle
    case plainListStyle
    case groupedListStyle
    case insetGroupedListStyle
}

public struct M7List<Content: View>: View {
    
    private let content: Content
    private let style: M7ListStyle
    
    public init(style: M7ListStyle = .defaultListStyle, @ViewBuilder content: () -> Content) {
        
        self.content = content()
        self.style = style
    }
    
    
    public var body: some View {
        
        containedView()
    }
    
    private func containedView() -> AnyView {
        
        switch self.style {
        
        case .defaultListStyle:
            return AnyView(
                List {
                    self.content
                })
            
        case .plainListStyle:
            return AnyView(
                List {
                    self.content
                }.listStyle(PlainListStyle()))
        case .groupedListStyle:
            return AnyView(
                List {
                    self.content
                }.listStyle(GroupedListStyle()))
        case .insetGroupedListStyle:
            
            if #available(iOS 14, *) {
                
                return AnyView(
                    List {
                        self.content
                        
                    }.listStyle(InsetGroupedListStyle())
                    
                )
                
            } else {
                
                return AnyView(
                    List {
                        self.content
                        
                    }.listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    
                )
            }
        }
    }
}

struct M7ListStyle_Previews: PreviewProvider {
    static var previews: some View {
        M7List {
            Text("Text")
        }
    }
}


