//
//  DeckDetailsViewModel.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

public struct DeckDetailsViewModel {
    private(set) public var deck: Powerdeck
    public var cards: [Powercard]
    
    public init(deck: Powerdeck, cards: [Powercard] = []) {
        self.deck = deck
        self.cards = cards
    }
}

extension DeckDetailsViewModel: Equatable {
    public static func ==(lhs: DeckDetailsViewModel, rhs: DeckDetailsViewModel) -> Bool {
        return lhs.deck == rhs.deck && lhs.cards == rhs.cards
    }
}
