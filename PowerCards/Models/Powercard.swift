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
    let subTitle: String?
//    let creationDate: Date
    let deckID: String?
    
    init(id: String, name: String, subTitle: String? = nil, deckID: String? = nil) {
        self.id = id
        self.name = name
        self.subTitle = subTitle
//        self.creationDate = Date()
        self.deckID = deckID
    }
}

extension Powercard: JSONInitializable {
    init?(json: [String : Any]) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String
            else { return nil }
        
        self.id = id
        self.name = name
        self.subTitle = json["subTitle"] as? String
        self.deckID = json["deckID"] as? String
        
    }
    
    init?(jsonDict: [[String : Any]]) {
        return nil
    }
}
