//
//  TestData.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

struct TestData {
    static var testDeckSet: Set<Powerdeck> {
        return [
            Powerdeck(id: "1", name: "Test", cards: 0),
            Powerdeck(id: "2", name: "Test deck 2", cards: 0, isShared: true)
        ]
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
