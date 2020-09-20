//
//  File 2.swift
//  
//
//  Created by 18391981 on 18.09.2020.
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
