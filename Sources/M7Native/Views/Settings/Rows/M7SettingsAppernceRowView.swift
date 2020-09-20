//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 18.09.2020.
//

import SwiftUI

public struct M7SettingsAppernceRowView: View {
    
    public var body: some View {
        
        NavigationLink(destination: M7ApperanceView()) {
            M7Row("Settings.AppernceTitle", leadingIcon: .heart, size: .s)
        }

    }
}
