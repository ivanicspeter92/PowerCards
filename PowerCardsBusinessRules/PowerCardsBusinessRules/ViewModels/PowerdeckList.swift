//
//  PowerdeckList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

protocol Sortable {
}

public struct PowerdeckList {
    public enum PowerdeckSorting {
        case byName
        case byNumberOfCards
    }
    
    public private(set) var sections: [PowerdeckListSection]
    public private(set) var sorting: PowerdeckSorting
    public private(set) var inverseSorting: Bool = false
    public private(set) var owner: User
    
    public init(owner: User, sorting: PowerdeckSorting = .byName, sections: [PowerdeckListSection] = PowerdeckType.all.map({ PowerdeckListSection(name: $0.name, powerdecks: [])}), inverseSorting: Bool = false) {
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
    
    public mutating func addNewDeck(deck: Powerdeck) -> Int {
        if deck.creator == self.owner {
            self.sections[0].append(deck: deck)
            return 0
        } else {
            self.sections[1].append(deck: deck)
            return 1
        }
    }
}
