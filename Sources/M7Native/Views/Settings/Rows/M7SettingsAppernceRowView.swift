//
//  SwiftUIView.swift
//  
//
//  Created by 18391981 on 18.09.2020.
//

import SwiftUI

public struct M7SettingsAppernceRowView: View {
    
    public var body: some View {
        
        NavigationLink(destination: ApperanceView()) {
            M7Row("Settings.AppernceTitle", leadingImage: .heart, size: .s)
        }
        
       
        
           
        
    }
}
