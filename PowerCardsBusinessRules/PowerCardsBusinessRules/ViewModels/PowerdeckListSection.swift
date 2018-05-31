//
//  PowerdeckListSection.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 24/05/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

public class PowerdeckListSection: Hashable {
    public let name: String
    public private(set) var powerdecks: [Powerdeck]
    
    public init(name: String, powerdecks: [Powerdeck]) {
        self.name = name
        self.powerdecks = powerdecks
    }
    
    var itemsCount: Int {
        return self.powerdecks.count
    }
    
    public var hashValue: Int {
        return self.name.hashValue
    }
    
    public static func ==(lhs: PowerdeckListSection, rhs: PowerdeckListSection) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func item(at index: Int) -> Powerdeck {
        return powerdecks[index]
    }
    
    public func append(deck: Powerdeck) {
        powerdecks.append(deck)
    }
    
    public func prepend(deck: Powerdeck) {
        powerdecks.insert(deck, at: 0)
    }
    
    public func delete(deck: Powerdeck) {
        if let index = powerdecks.index(of: deck) {
            self.delete(atIndex: index)
        }
    }
    
    public func delete(atIndex index: Int) {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.deckDeleted.rawValue), object: powerdecks[index], userInfo: nil))
        powerdecks.remove(at: index)
    }
}
