//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 18.09.2020.
//

import SwiftUI

public struct M7ApperanceView: View {
    
    let accentColors: [AccentColor] = accentColorsData
    @ObservedObject var accentColor = AccentColorSetting()
    @State private var isThemeChanged: Bool = false
    
    @ObservedObject var theme = M7ThemeColorSetting()
    
    public var body: some View {
        
        M7ThemingView {
            
            M7List("Apperance.NavigationBar.Title", style: .groupedListStyle) {
                
                Section(header:
                            HStack {
                                M7Text("Choose the app theme", style: .overline)
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(accentColors[self.accentColor.accentColorSetting].themeColor)
                            }
                ) {
                    
                    ForEach(accentColors, id: \.id) { item in
                        Button(action: {
                            self.accentColor.accentColorSetting = item.id
                            UserDefaults.standard.set(self.accentColor.accentColorSetting, forKey: "Settings.Apperance.AccentColor")
                            self.isThemeChanged.toggle()
                        }) {
                            
                            M7Row(item.colorName, leadingImage: Image(systemName: "circle.fill"), size: .s)
                            //                            HStack {
                            //                                Image(systemName: "circle.fill")
                            //                                    .foregroundColor(item.themeColor)
                            //
                            //                                Text(item.colorName)
                            //                            }
                        } //: BUTTON
                        .accentColor(Color.primary)
                    }
                    
                }
                .padding(.vertical, 3)
                .alert(isPresented: $isThemeChanged) {
                    Alert(
                        title: Text("SUCCESS!"),
                        message: Text("App has been changed to th. Now close and restart it!"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
                
                Section(header: M7Text("Apperance.SectionTheme.Title", style: .overline)) {
                    
                    M7RowButton("System") {
                        self.theme.themeSetting = "system"
                        UserDefaults.standard.set(self.theme.themeSetting, forKey: "Settings.Apperance.Theme")
                    }
                    
                    M7RowButton("Dark") {
                        self.theme.themeSetting = "dark"
                        UserDefaults.standard.set(self.theme.themeSetting, forKey: "Settings.Apperance.Theme")
                    }
                    
                    M7RowButton("Light") {
                        self.theme.themeSetting = "light"
                        UserDefaults.standard.set(self.theme.themeSetting, forKey: "Settings.Apperance.Theme")
                    }
                    
                }
                
            }
        }
        
    }
}
