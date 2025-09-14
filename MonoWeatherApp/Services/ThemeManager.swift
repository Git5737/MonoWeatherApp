//
//  ThemeManager.swift
//  MonoWeatherApp
//
//  Created by mac on 14.09.2025.
//

import UIKit

enum AppTheme: String {
    case light, dark
}

class ThemeManager {
    static let shared = ThemeManager()
    
    private init() {}
    
    var currentTheme: AppTheme {
        get {
            if let saved = UserDefaults.standard.string(forKey: "AppTheme"),
               let theme = AppTheme(rawValue: saved) {
                return theme
            }
            return .light
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "AppTheme")
            applyTheme(newValue)
        }
    }
    
    func applyTheme(_ theme: AppTheme) {
        guard let window = UIApplication.shared.windows.first else { return }
        
        switch theme {
        case .light:
            window.overrideUserInterfaceStyle = .light
        case .dark:
            window.overrideUserInterfaceStyle = .dark
        }
    }
}
