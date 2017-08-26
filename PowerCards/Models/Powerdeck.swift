//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

struct Powerdeck: JSONInitializable {
    let id: String
    let name: String
    let subTitle: String?
    let cards: Int
    let isShared: Bool
    let creationDate: Date
    
    init(id: String, name: String, subTitle: String? = nil, cards: Int = 0, isShared: Bool = false) {
        self.id = id
        self.name = name
        self.subTitle = subTitle
        self.cards = cards
        self.isShared = isShared
        self.creationDate = Date()
    }
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String
            else { return nil }
        
        self.id = id
        self.name = name
        self.subTitle = json["subTitle"] as? String
        self.isShared = json["isShared"] as? Bool ?? false
        if let creationDate = json["creationDate"] as? String {
            let formatter = DateFormatter()
            self.creationDate = formatter.date(from: creationDate) ?? Date()
        } else {
            self.creationDate = Date()
        }
        self.cards = json["cards"] as? Int ?? 0
    }
}
