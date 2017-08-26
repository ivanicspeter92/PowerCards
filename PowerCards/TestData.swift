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
            Powerdeck(name: "Test", cards: [
                Powercard(id: "1", name: "bla"),
                Powercard(id: "2", name: "blabla")
                ]),
            Powerdeck(name: "Test deck 2", cards: [
                Powercard(id: "3", name: "BLA", subtitle: "My favorite deck"),
                Powercard(id: "4", name: "BLABLA")
                ], isShared: true)
        ]
    }
}
