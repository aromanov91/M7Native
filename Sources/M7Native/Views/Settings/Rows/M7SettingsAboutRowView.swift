
//
//  File.swift
//
//
//  Created by Alexander Romanov on 17.09.2020.
//

import SwiftUI
import StoreKit

public struct M7SettingsAboutRowView: View {
    
    public var body: some View {
        
        NavigationLink(destination: M7AboutView()) {
            M7Row("About", leadingIcon: .info, size: .s)
        }
        
        

    }
}
