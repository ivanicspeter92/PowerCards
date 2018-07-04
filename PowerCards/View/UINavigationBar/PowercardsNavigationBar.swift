//
//  PowercardsNavigationBar.swift
//  PowerCards
//
//  Created by Peter Ivanics on 04/07/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class PowercardsNavigationBar: UINavigationBar {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        barTintColor = ThemeManager.current.mainBackgroundColor
        tintColor = ThemeManager.current.tabbarTintColor
        titleTextAttributes = [NSAttributedStringKey.foregroundColor: ThemeManager.current.tabbarTintColor]
    }
}
