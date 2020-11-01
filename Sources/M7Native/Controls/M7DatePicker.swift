//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 31.10.2020.
//

import SwiftUI

public struct M7DatePicker<SheetContent: View>: ViewModifier {
    @Binding public var isPresented: Bool
    let sheetContent: () -> SheetContent
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    self.isPresented = false
                                }
                            }) {
                                Text(M7Localize.button.done)
                                    .padding(.top, 5)
                            }
                        }
                        
                        sheetContent()
                    }
                    .padding()
                }
                .zIndex(.infinity)
                .transition(.move(edge: .bottom))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

extension View {
    public func customBottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        sheetContent: @escaping () -> SheetContent
    ) -> some View {
        self.modifier(M7DatePicker(isPresented: isPresented, sheetContent: sheetContent))
    }
}
