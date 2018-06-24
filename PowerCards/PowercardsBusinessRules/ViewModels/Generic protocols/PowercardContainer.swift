//
//  PowercardContainer.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

public protocol PowercardContainer {
    var cards: [Powercard] { get set }
    
    mutating func insert(card: Powercard)
    mutating func removeCard(at index: Int)
    func card(at index: Int) -> Powercard?
    func contains(card: Powercard) -> Bool
}

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
