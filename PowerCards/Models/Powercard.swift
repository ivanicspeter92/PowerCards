//
//  Powercard.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

struct Powercard {
    let id: String
    let name: String
    let subTitle: String
    let creationDate: Date
    
    init(id: String, name: String, subTitle: String = "") {
        self.id = id
        self.name = name
        self.subTitle = subTitle
        self.creationDate = Date()
    }
}
