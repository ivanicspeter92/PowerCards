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
    
    public private(set) var sections: [PowerdeckListSection]
    public private(set) var sorting: PowerdeckSorting
    public private(set) var inverseSorting: Bool = false
    public private(set) var owner: User
    
    public init(owner: User, sorting: PowerdeckSorting = .byName, sections: [PowerdeckListSection] = PowerdeckType.all.map({ PowerdeckListSection(type: $0, powerdecks: [])}), inverseSorting: Bool = false) {
        self.owner = owner
        self.sections = sections
        self.sorting = sorting
        self.inverseSorting = inverseSorting
    }
    
    public func section(at index: Int) -> PowerdeckListSection? {
        if index >= 0 && index < sections.count {
            return sections[index]
        }
        return nil
    }
    
    public mutating func addNewDeck(deck: Powerdeck) -> IndexPath {
        if deck.creator == self.owner {
            self.sections[0].append(deck: deck)
            return IndexPath(row: self.sections[0].itemsCount - 1, section: 0)
        } else {
            self.sections[1].append(deck: deck)
            return IndexPath(row: self.sections[1].itemsCount - 1, section: 1)
        }
    }
    
    public func contains(deck: Powerdeck) -> Bool {
        for section in self.sections {
            if section.powerdecks.contains(deck) {
                return true
            }
        }
        
        return false
    }
}
