//
//  M7SettingsStore.swift
//  
//
//  Created by Aleksandr Romanov on 06.10.2020.
//

import SwiftUI
import Combine

public enum M7ApperanseMode: String, CaseIterable {
    case system
    case light
    case dark
}

public class M7SettingsStore: ObservableObject {
    
    private enum Keys {
        static let pro = "Settings.Pro"
        static let apperance = "Settings.Apperance.Theme"
        static let vibration = "Settings.Vibration"
        static let sound = "Settings.Sound"
    }
    
    public let cancellable: Cancellable
    public let defaults: UserDefaults
    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    public init(defaults: UserDefaults = .standard) {
        
        self.defaults = defaults
        
        defaults.register(defaults: [
            Keys.vibration: true,
            Keys.sound: true,
            Keys.apperance: M7ApperanseMode.system.rawValue,
        ])
        
        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map { _ in () }
            .subscribe(objectWillChange)
    }
    
    public var isPro: Bool {
        set { defaults.set(newValue, forKey: Keys.pro) }
        get { defaults.bool(forKey: Keys.pro) }
    }
    
    public var isVibration: Bool {
        set { defaults.set(newValue, forKey: Keys.vibration) }
        get { defaults.bool(forKey: Keys.vibration) }
    }
    
    public var isSound: Bool {
        set { defaults.set(newValue, forKey: Keys.sound) }
        get { defaults.bool(forKey: Keys.sound) }
    }

    public var apperancMode: M7ApperanseMode {
        get {
            return defaults.string(forKey: Keys.apperance)
                .flatMap { M7ApperanseMode(rawValue: $0) } ?? .system
        }

        set {
            defaults.set(newValue.rawValue, forKey: Keys.apperance)
        }
    }
    
//    public var isSystemApperance: bool {
//        
//        let apperance = defaults.bool(forKey: Keys.apperance)
//        
//        if apperance != M7ApperanseMode.system.rawValue {
//            return false
//        } else {
//            return true
//        }
//        
//        
//        
//    }
    
}
