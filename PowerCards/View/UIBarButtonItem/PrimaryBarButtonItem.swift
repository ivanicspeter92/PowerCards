//
//  PrimaryBarButtonItem.swift
//  PowerCards
//
//  Created by Peter Ivanics on 04/07/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class PrimaryBarButtonItem: UIBarButtonItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tintColor = ThemeManager.current.tabbarTintColor
    }
}
