//
//  File.swift
//  
//
//  Created by 18391981 on 11.10.2020.
//

import SwiftUI

public class M7Info {
    
    
    public enum app {
        
        /// Version
        public static var version: String? {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        }
        
        /// Name
        public static var name: String? {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        }
        
        public static var privacyPolicyUrl: String = ""
        
        public static var termsOfUseUrl: String = ""
        
        public static var iconName: String = "icon"
        
        public static var supportUrl: String = ""
        
        public static var facebookMessengerChatUrl: String = ""
        
        public static var telegramChatUrl: String = ""
        
        public static var appStoreUrl: String = ""
        
    }
    
    public enum author {
        
        public static var name: String = ""
        
        public static var email: String = ""
        
        public static var url: String = ""
        
        public static var appStoreUrl: String = ""
        
        public static var telegramAccountUrl: String = ""
        
        public static var facebookAccountUrl: String = ""
        
        
    }
    
    public init(privacyPolicyUrl: String = "",
                termsOfUseUrl: String = "",
                iconName: String = "",
                supportUrl: String = "",
                facebookMessengerChatUrl: String = "",
                telegramChatUrl: String = "",
                appStoreUrl: String = "") {
        
        app.privacyPolicyUrl = privacyPolicyUrl
        app.termsOfUseUrl = termsOfUseUrl
        app.iconName = iconName
        app.supportUrl = supportUrl
        app.facebookMessengerChatUrl = facebookMessengerChatUrl
        app.telegramChatUrl = telegramChatUrl
        app.appStoreUrl = appStoreUrl
    }
    
    public init(name: String = "",
        email: String = "",
                url: String = "",
                appStoreUrl: String = "",
                telegramAccountUrl: String = "",
                facebookAccountUrl: String = "") {
        
        author.name = name
        author.email = email
        author.url = url
        author.appStoreUrl = appStoreUrl
        author.telegramAccountUrl = telegramAccountUrl
        author.facebookAccountUrl = facebookAccountUrl
    }
}
