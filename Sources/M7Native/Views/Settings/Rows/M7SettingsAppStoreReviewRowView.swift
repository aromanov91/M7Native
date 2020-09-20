//
//  File.swift
//  
//
//  Created by Alexander Romanov on 17.09.2020.
//

import SwiftUI
import StoreKit

public struct M7SettingsAppStoreReviewRowView: View {
    
    public var body: some View {
        
        Button(action: {

            SKStoreReviewController.requestReview()
            
        }) {
            M7Row("Settings.ReviewAppStoreTitle", leadingIcon: .heart, size: .s)
        }
    }
}
