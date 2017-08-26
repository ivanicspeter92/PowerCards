//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

struct Powerdeck {
    let name: String
    let cards: Set<Powercard>
    var isShared: Bool
    let creationDate: Date
    let imageSource: String?
    
    init(name: String, cards: Set<Powercard>, isShared: Bool = false, imageSource: String? = nil) {
        self.name = name
        self.cards = cards
        self.isShared = isShared
        self.creationDate = Date()
        self.imageSource = imageSource
    }
    
    mutating func invertSharing() {
        self.isShared = !isShared
    }
}
