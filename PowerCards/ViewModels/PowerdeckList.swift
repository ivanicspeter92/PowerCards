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
    
    private let powerdecks: Set<Powerdeck>
    var sorting: PowerdeckSorting
    var inverseSorting: Bool = false
    
    var count: Int {
        return powerdecks.count
    }
    
    init(powerdecks: Set<Powerdeck>, sorting: PowerdeckSorting, inverseSorting: Bool = false) {
        self.powerdecks = powerdecks
        self.sorting = sorting
        self.inverseSorting = inverseSorting
    }
    
    func item(at index: Int) -> Powerdeck {
        return powerdecks.item(at: index)
    }
}
