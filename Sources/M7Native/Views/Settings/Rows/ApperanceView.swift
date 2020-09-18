//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 18.09.2020.
//

import SwiftUI

public struct ApperanceView: View {
    
    
    let accentColors: [AccentColor] = accentColorsData
    @ObservedObject var accentColor = AccentColorSetting()
    @State private var isThemeChanged: Bool = false
    
    
    public var body: some View {
        
        Section(header:
          HStack {
            Text("Choose the app theme")
            Image(systemName: "circle.fill")
              .resizable()
              .frame(width: 10, height: 10)
                .foregroundColor(accentColors[self.accentColor.accentColorSetting].themeColor)
          }
        ) {
          List {
            ForEach(accentColors, id: \.id) { item in
              Button(action: {
                self.accentColor.accentColorSetting = item.id
                UserDefaults.standard.set(self.accentColor.accentColorSetting, forKey: "Settings.Apperance.AccentColor")
                self.isThemeChanged.toggle()
              }) {
                HStack {
                  Image(systemName: "circle.fill")
                    .foregroundColor(item.themeColor)
                  
                  Text(item.colorName)
                }
              } //: BUTTON
                .accentColor(Color.primary)
            }
          }
        } //: SECTION 2
          .padding(.vertical, 3)
          .alert(isPresented: $isThemeChanged) {
            Alert(
              title: Text("SUCCESS!"),
                message: Text("App has been changed to th. Now close and restart it!"),
              dismissButton: .default(Text("OK"))
            )
        }
    }
}
