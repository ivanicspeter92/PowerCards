//
//  PowerdeckList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

struct PowerdeckList {
    enum PowerdeckSorting {
        case byName
        case byNumberOfCards
    }
    
    private var powerdecks: [Powerdeck]
    var sorting: PowerdeckSorting
    var inverseSorting: Bool = false
    
    var count: Int {
        return powerdecks.count
    }
    
    init(powerdecks: Set<Powerdeck>, sorting: PowerdeckSorting, inverseSorting: Bool = false) {
        self.powerdecks = Array(powerdecks)
        self.sorting = sorting
        self.inverseSorting = inverseSorting
    }
    
    func item(at index: Int) -> Powerdeck {
        return powerdecks[index]
    }
    
    mutating func append(deck: Powerdeck) {
        powerdecks.append(deck)
    }
    
    mutating func prepend(deck: Powerdeck) {
        powerdecks.insert(deck, at: 0)
    }
    
    mutating func delete(deck: Powerdeck) {
        if let index = powerdecks.index(of: deck) {
            self.delete(atIndex: index)
        }
        
    }
    
    mutating func delete(atIndex index: Int) {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.DeckDeletedNotification), object: powerdecks[index], userInfo: nil))
        powerdecks.remove(at: index)
    }
}
