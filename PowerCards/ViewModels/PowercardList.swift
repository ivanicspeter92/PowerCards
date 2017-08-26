//
//  PowercardList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

struct PowercardList {
    let cards: Set<Powercard>
    
    func item(at index: Int) -> Powercard {
        return cards[cards.index(cards.startIndex, offsetBy: index)]
    }
}
