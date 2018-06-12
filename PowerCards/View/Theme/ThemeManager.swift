//
//  ThemeManager.swift
//  PowerCards
//
//  Created by Peter Ivanics on 12/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

struct ThemeManager {
    private static let SelectedThemeKey = "SelectedThemeKey"
    
    private init() {
    }
    
    static var current: Theme {
        if let storedTheme = UserDefaults.standard.value(forKey: SelectedThemeKey) as? Int, let theme = Theme(rawValue: storedTheme) {
            return theme
        } else {
            return .default
        }
    }
    
    static func apply(theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        applyToolbarUIViewSettings(for: theme)
    }
    
    // MARK: Private
    static private func applyToolbarUIViewSettings(for theme: Theme) {
        ToolbarUIView.appearance().backgroundColor = theme.toolbarBackgroundColor
    }
}

