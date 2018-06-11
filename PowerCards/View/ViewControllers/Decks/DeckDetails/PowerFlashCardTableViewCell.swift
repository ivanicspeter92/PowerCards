//
//  PowerFlashCardTableViewCell.swift
//  PowerCards
//
//  Created by Peter Ivanics on 11/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class PowerFlashCardTableViewCell: UITableViewCell {
    var card: PowerFlashCard!
    
    // MARK: Lifecycle
    init(powercard: PowerFlashCard, style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.card = powercard
        
        loadCardTitleToView()
        loadCardSubTitleToView()
        loadCardImageToView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cardNameChangedToDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.cardNameChanged.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(cardSubtitleChangedFromDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.cardSubtitleChanged.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(cardImageChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.cardImageChanged.rawValue), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notification listeners
    @objc func cardNameChangedToDeckNotificationReceived(_ notification: Notification) {
        guard let card = notification.object as? PowerFlashCard, card == self.card else { return }
        
        loadCardTitleToView()
    }
    
    @objc func cardSubtitleChangedFromDeckNotificationReceived(_ notification: Notification) {
        guard let card = notification.object as? PowerFlashCard, card == self.card else { return }
        
        loadCardSubTitleToView()
    }
    
    @objc func cardImageChangedNotificationReceived(_ notification: Notification) {
        guard let card = notification.object as? PowerFlashCard, card == self.card else { return }
        
        loadCardImageToView()
    }
    
    // MARK: Private
    private func loadCardTitleToView() {
        textLabel?.text = card.name
    }
    
    private func loadCardSubTitleToView() {
        detailTextLabel?.text = card.subTitle
    }
    
    private func loadCardImageToView() {
        imageView?.image = card.image ?? #imageLiteral(resourceName: "camera")
    }
}
