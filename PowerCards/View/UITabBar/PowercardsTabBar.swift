//
//  PowercardsTabBar.swift
//  PowerCards
//
//  Created by Peter Ivanics on 04/07/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class PowercardsTabBar: UITabBar {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        barTintColor = ThemeManager.current.tabbarBackgroundColor
    }
}
