//
//  PowerdeckList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

public struct PowerdeckList {
    public enum PowerdeckSorting {
        case byName
        case byNumberOfCards
    }
    
    public var powerdecks: [Powerdeck]
    public var sorting: PowerdeckSorting
    public var inverseSorting: Bool = false
    
    public var count: Int {
        return powerdecks.count
    }
    
    public init() {
        self.init(powerdecks: [])
    }
    
    public init(powerdecks: Set<Powerdeck>, sorting: PowerdeckSorting = .byName, inverseSorting: Bool = false) {
        self.powerdecks = Array(powerdecks)
        self.sorting = sorting
        self.inverseSorting = inverseSorting
    }
    
    public func item(at index: Int) -> Powerdeck {
        return powerdecks[index]
    }
    
    mutating public func append(deck: Powerdeck) {
        powerdecks.append(deck)
    }
    
    mutating public func prepend(deck: Powerdeck) {
        powerdecks.insert(deck, at: 0)
    }
    
    mutating public func delete(deck: Powerdeck) {
        if let index = powerdecks.index(of: deck) {
            self.delete(atIndex: index)
        }
    }
    
    mutating public func delete(atIndex index: Int) {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.DeckDeletedNotification), object: powerdecks[index], userInfo: nil))
        powerdecks.remove(at: index)
    }
}

extension PowerdeckList: JSONInitializable {
    init?(jsonDict: [[String : Any]]) {
        self.powerdecks = []
        self.sorting = .byName
        
        jsonDict.forEach({
            if let deck = Powerdeck(json: $0) {
                self.powerdecks.append(deck)
            }
        })
    }
    
    init?(json: [String : Any]) {
        return nil
    }
}
