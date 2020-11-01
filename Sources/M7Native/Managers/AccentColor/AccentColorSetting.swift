//
//  File 2.swift
//  
//
//  Created by Alexander Romanov on 18.09.2020.
//

import SwiftUI

// MARK: - THEME CLASS

public class AccentColorSetting: ObservableObject {
  @Published var accentColorSetting: Int = UserDefaults.standard.integer(forKey: "Settings.Apperance.AccentColor") {
    didSet {
      UserDefaults.standard.set(self.accentColorSetting, forKey: "Settings.Apperance.AccentColor")
    }
  }
}
