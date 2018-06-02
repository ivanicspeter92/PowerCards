//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
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
    public let isShared: Bool
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
    
    public func removeCard(at index: Int) {
        self.cards.remove(at: index)
    }
    
    public func createBlankCard(backgroundColor: UIColor, size: CGSize = UIScreen.main.bounds.size) -> PowercardViewModel? {
        if let image = UIImage(color: backgroundColor, size: size) {
            return createCard(with: image)
        }
        return nil
    }
    
    public func createBlankCard() -> PowercardViewModel? {
        return createBlankCard(backgroundColor: UIColor(named: "PaperColor") ?? UIColor.white)
    }
    
    public func createCard(with image: UIImage) -> PowercardViewModel? {
        return PowercardViewModel(image: image, name: "Card", subtitle: "")
    }
}
