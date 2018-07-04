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
        
//        applyUIViewSettings(for: theme)
        applyToolbarUIViewSettings(for: theme)
        applyUITabBarViewSettings(for: theme)
        
        UIApplication.shared.statusBarStyle = theme.statusBarStyle
    }
    
    // MARK: Private
    static private func applyUIViewSettings(for theme: Theme) {
        UITabBar.appearance().backgroundColor = theme.mainColor
        
    }
    
    static private func applyToolbarUIViewSettings(for theme: Theme) {
        ToolbarUIView.appearance().backgroundColor = theme.toolbarBackgroundColor
    }
    
    static private func applyUITabBarViewSettings(for theme: Theme) {
        UITabBar.appearance().backgroundColor = theme.tabbarBackgroundColor
        UITabBar.appearance().tintColor = theme.tabbarTintColor
    }
}

