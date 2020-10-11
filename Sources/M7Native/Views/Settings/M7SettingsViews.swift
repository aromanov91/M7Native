//
//  M7SettingsViews.swift
//  
//
//  Created by Alexander Romanov on 16.09.2020.
//

import SwiftUI

public struct M7SettingsViews: View {
    
    @EnvironmentObject var settings: M7SettingsStore
    
    public init() {}

    public var body: some View {
        
        M7ThemingView {
            
            NavigationView {
                
                M7List(M7Localize.settings.title ,style: .groupedListStyle) {
                    
                    Section(header: M7Text(M7Localize.settings.appSection, style: .overline, color: .onBackgroundMediumEmphasis)) {
                        
                        M7SettingsAppernceRowView()
                        
                        M7Row("Vibration", type: .toggle, leadingIcon: .volume, toggle: $settings.isVibration)
                        
                    }
                    
                    Section(header: M7Text(M7Localize.settings.supportSection, style: .overline, color: .onBackgroundMediumEmphasis)) {
                        
                        M7SettingsAppStoreReviewRowView()
                        
                        M7SettingsMessageLinkRowView("aromanov07@gmail.com", subject: "FeedBack")
                        
                        M7SettingsTelegramLinkRowView("https://www.google.com")
                        
                    }
                    

                    M7SettingsAboutRowView()
                }
                
                
                
            }
        }
    }
}

struct M7SettingsViews_Previews: PreviewProvider {
    static var previews: some View {
        M7SettingsViews()
    }
}
