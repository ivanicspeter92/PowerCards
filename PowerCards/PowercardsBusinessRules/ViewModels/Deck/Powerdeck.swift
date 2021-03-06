//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

public class Powerdeck {
    public let id: String
    public var name: String {
        didSet {
            if name != oldValue {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.deckNameChanged.rawValue), object: self, userInfo: nil))
            }
        }
    }
    public let subTitle: String?
    public var cards: [Powercard]
    public var isShared: Bool
    public let creationDate: Date
    public let creator: User
    
    public init(id: String, name: String, creator: User, subTitle: String? = nil, cards: [Powercard] = [], isShared: Bool = false) {
        self.id = id
        self.name = name
        self.creator = creator
        self.subTitle = subTitle
        self.cards = cards
        self.isShared = isShared
        self.creationDate = Date()
    }
    
    public var canModifySharingOptions: Bool {
        return creator == UserSession.shared.currentUser
    }
}

extension Powerdeck: PowercardContainer {
    public func card(at index: Int) -> Powercard? {
        if index >= 0 && index < cards.count {
            return self.cards[index]
        }
        return nil
    }
    
    public func insert(card: Powercard) {
        cards.append(card)
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.newCardWasAddedToDeck.rawValue), object: self, userInfo: nil))
    }
    
    public func removeCard(at index: Int) {
        self.cards.remove(at: index)
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.cardWasRemovedFromDeck.rawValue), object: self, userInfo: nil))
    }
    
    public func contains(card: Powercard) -> Bool {
        return self.cards.contains(where: { $0 == card })
    }
}
