//
//  TestData.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import PowerCardsBusinessRules

struct TestData {
    static var testDeckSet: Set<Powerdeck> {
        return [
            Powerdeck(id: "1", name: "Test", creator: testUser, cards: 0),
            Powerdeck(id: "2", name: "Test deck 2", creator: testUser, cards: 0, isShared: true)
        ]
    }
    
    static var testUser: User {
        return User(id: 1, name: "Peter Ivanics", email: "peter.ivanics@helsinki.fi")
    }
//    [
//    Powercard(id: "1", name: "bla"),
//    Powercard(id: "2", name: "blabla")
//    ]
//    [
//    Powercard(id: "3", name: "BLA", subTitle: "My favorite deck"),
//    Powercard(id: "4", name: "BLABLA")
//    ]
}
