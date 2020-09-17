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
        
        M7List {
            
            M7SettingsMessageLinkRowView("aromanov07@gmail.com")
            
            M7SettingsTelegramLinkRowView("https://www.google.com")
        }
        
    }
}
