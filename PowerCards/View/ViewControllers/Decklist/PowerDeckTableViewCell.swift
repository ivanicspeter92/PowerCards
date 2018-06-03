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
    
    // MARK: Initializers
    init(powerdeck: Powerdeck, style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.powerdeck = powerdeck
        textLabel?.text = powerdeck.name
        
        if powerdeck.isShared {
            textLabel?.text = (textLabel?.text ?? "") + " (Shared)"
        }
        
        loadCardCountToView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(newCardWasAddedToDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.newCardWasAddedToDeck.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(cardWasRemovedFromDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.cardWasRemovedFromDeck.rawValue), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func loadCardCountToView() {
        detailTextLabel?.text = "\(powerdeck.cards.count)"
    }
    
    // MARK: Notification listeners
    @objc func newCardWasAddedToDeckNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        loadCardCountToView()
    }
    
    @objc func cardWasRemovedFromDeckNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        loadCardCountToView()
    }
}
