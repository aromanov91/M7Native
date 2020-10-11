//
//  M7SettingsStore.swift
//  
//
//  Created by Aleksandr Romanov on 06.10.2020.
//

import SwiftUI
import Combine

public class M7SettingsStore: ObservableObject {
    
    private enum Keys {
        static let pro = "Settings.Pro"
        static let apperance = "Settings.Apperance"
        static let vibration = "Settings.Vibration"
    }
    
    public let cancellable: Cancellable
    public let defaults: UserDefaults
    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    public init(defaults: UserDefaults = .standard) {
        
        self.defaults = defaults
        
        defaults.register(defaults: [
            Keys.vibration: true,
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
    
}
