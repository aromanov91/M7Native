//
//  M7SettingsViews.swift
//  
//
//  Created by Alexander Romanov on 16.09.2020.
//

import SwiftUI

public struct M7SettingsViews: View {
    
    public init(){}
    
    public var body: some View {
        
        NavigationView {
        
        M7List(style: .groupedListStyle) {
            
            
            Section {
                
                M7SettingsAppernceRowView()
                
            }
            
            Section(header: M7Text("Settings.SupportSectionTitle", style: .overline, color: .onBackgroundMediumEmphasis) ) {
                
                M7SettingsAppStoreReviewRowView()
                
                M7SettingsMessageLinkRowView("aromanov07@gmail.com", subject: "FeedBack")
                
                M7SettingsTelegramLinkRowView("https://www.google.com")
                
            }
        }
            
        }.navigationBarTitle(LocalizedStringKey("Settings.NavigationBar.Title"))
        
    }
}
