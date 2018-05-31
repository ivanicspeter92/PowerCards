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
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckNameChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.deckNameChanged.rawValue), object: nil)
        
        if powerdeck.isShared {
            textLabel?.text = (textLabel?.text ?? "") + " (Shared)"
        }
        
        detailTextLabel?.text = "\(powerdeck.cards.count)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Notification listeners
    @objc func deckNameChangedNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        textLabel?.text = powerdeck.name
    }
}
