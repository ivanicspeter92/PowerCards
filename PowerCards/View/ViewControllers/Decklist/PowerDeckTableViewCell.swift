//
//  PowerDeckTableViewCell.swift
//  PowerCards
//
//  Created by Peter Ivanics on 29/05/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit
import PowerCardsBusinessRules

class PowerDeckTableViewCell: UITableViewCell {
    var powerdeck: Powerdeck!
    
    init(powerdeck: Powerdeck, style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.powerdeck = powerdeck
        textLabel?.text = powerdeck.name
        
        if powerdeck.isShared {
            textLabel?.text = (textLabel?.text ?? "") + " (Shared)"
        }
        
        detailTextLabel?.text = "\(powerdeck.cards.count)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
