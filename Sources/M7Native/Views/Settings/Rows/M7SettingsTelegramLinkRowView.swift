//
//  M7SettingsTelegramLinkRowView.swift
//  
//
//  Created by Alexander Romanov on 16.09.2020.
//

import SwiftUI

public struct M7SettingsTelegramLinkRowView: View {
    
    var link: String
    
    public init(_ link: String) {
        self.link = link
    }
    
    public var body: some View {
        
        Button(action: {
            // OPEN A LINK
            guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
                return
            }
            UIApplication.shared.open(url as URL)
            
        }) {
            M7Row("Settings.TelegramChatTitle", leadingImage: .send, size: .s)
        }
    }
}
