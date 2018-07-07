//
//  PowercardsToolbar.swift
//  PowerCards
//
//  Created by Peter Ivanics on 04/07/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class PowercardsToolbar: UIToolbar {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        barTintColor = ThemeManager.current.mainBackgroundColor
        backgroundColor = ThemeManager.current.mainBackgroundColor
    }
}
