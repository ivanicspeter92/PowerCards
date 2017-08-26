//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

struct Powerdeck {
    let name: String
    let cards: Set<Powercard>
    var isShared: Bool
    
    init(name: String, cards: Set<Powercard>, isShared: Bool = false) {
        self.name = name
        self.cards = cards
        self.isShared = isShared
    }
    
    mutating func invertSharing() {
        self.isShared = !isShared
    }
}
