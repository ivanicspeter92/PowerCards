//
//  PowerdeckList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

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
}
