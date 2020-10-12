//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 11.10.2020.
//

import SwiftUI

public struct M7AboutView: View {
    
    public var body: some View {
        
        
        
        M7List("", style: .insetGroupedListStyle) {
            
            
            
            Section(header:  HStack(alignment: .center) { Spacer()
                        VStack(spacing: 30) {
                            
                            Image(M7Info.app.iconName)
                                .frame(width: 100, height: 100)
                            
                            
                            
                            M7Text(M7Info.app.version ?? "version", alignment: .center)
                                .padding(.bottom, 20)
                        }
                        
                        
                        Spacer() },
                    footer:    HStack(alignment: .center) { Spacer() ; M7Text(M7Info.author.name, alignment: .center).padding(.top, 20) ; Spacer() }) {
                
                M7Row("Политика конфедициальности")
                
                M7Row("Лицензионные соглашения")
                
            }
            
        }
        
    }
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        M7AboutView()
    }
}
