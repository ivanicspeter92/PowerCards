//
//  TestData.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import PowerCardsBusinessRules

struct TestData {
    static var endocrineCards: [Powercard] {
        return [
            PowerFlashCard(name: "Hypothalamus", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Hypothalamus")),
            PowerFlashCard(name: "Pineal body", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Pineal body")),
            PowerFlashCard(name: "Digestive system", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Digestive system")),
            PowerFlashCard(name: "Kidney", subTitle: nil, image: UIImage(named: "Kidney"))
        ]
    }
    
    static var testDeckSet: Set<Powerdeck> {
        return [
//            Powerdeck(id: "1", name: "Test", creator: testUser),
//            Powerdeck(id: "2", name: "Test deck 2", creator: testUser, isShared: true),
            Powerdeck(id: UUID().uuidString, name: "Endocrine", creator: testUser, cards: endocrineCards)
        ]
    }
    
    static var testUser: User {
        return User(id: 1, name: "Peter Ivanics", email: "peter.ivanics@helsinki.fi")
    }
}
