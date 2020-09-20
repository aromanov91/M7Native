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
    
    private let title: String
    private let content: Content
    private let style: M7ListStyle
    
    public init(_ title: String = "", style: M7ListStyle = .defaultListStyle, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.style = style
    }
    
    
    public var body: some View {
        containedView()
    }
    
    private func containedView() -> AnyView {
        
        switch self.style {
        
        case .defaultListStyle:
            
            if title == "" {
                
                return AnyView(
                    List { self.content })
                
            } else {
                
                return AnyView(
                    List { self.content }
                        .navigationBarTitle(Text(LocalizedStringKey(title), bundle: .module)))
            }
            
        case .plainListStyle:
            
            if title == "" {
                
                return AnyView(
                    List { self.content  }.listStyle(PlainListStyle()))
                
            } else {
                
                return AnyView(
                    List { self.content  }.listStyle(PlainListStyle())
                        .navigationBarTitle(Text(LocalizedStringKey(title), bundle: .module)))
            }
            
           
            
        case .groupedListStyle:
            
            
            if title == "" {
                

                    return AnyView(
                        List { self.content }.listStyle(GroupedListStyle()))
                
            } else {
                
             
                    return AnyView(
                        List { self.content }.listStyle(GroupedListStyle())
                        .navigationBarTitle(Text(LocalizedStringKey(title), bundle: .module)))
            }
            
        case .insetGroupedListStyle:
            
            if #available(iOS 14, *) {
                
                if title == "" {

                    return AnyView(
                        List {
                            self.content
                            
                        }.listStyle(InsetGroupedListStyle())
                        
                    )
                    
                } else {
                    
                    return AnyView(
                        List {
                            self.content
                            
                        }.listStyle(InsetGroupedListStyle())
                        .navigationTitle(Text(LocalizedStringKey(title), bundle: .module))
                        
                    )
                    
                    
                }
                
            } else {
                
                if title == "" {
                    
                    return AnyView(
                        List {
                            self.content
                            
                        }.listStyle(GroupedListStyle())
                        .environment(\.horizontalSizeClass, .regular)
                        
                    )
                    
                } else {
                    
                    return AnyView(
                        List {
                            self.content
                            
                        }.listStyle(GroupedListStyle())
                        .environment(\.horizontalSizeClass, .regular)
                        .navigationBarTitle(Text(LocalizedStringKey(title), bundle: .module))
                        
                    )
                }
                
                
                

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


