//
//  Powerdeck.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

public struct Powerdeck: JSONInitializable {
    public let id: String
    public let name: String
    public let subTitle: String?
    public let cards: Int
    public let isShared: Bool
    public let creationDate: Date
    public let creator: User
    
    public init(id: String, name: String, creator: User, subTitle: String? = nil, cards: Int = 0, isShared: Bool = false) {
        self.id = id
        self.name = name
        self.creator = creator
        self.subTitle = subTitle
        self.cards = cards
        self.isShared = isShared
        self.creationDate = Date()
    }
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String,
            let creatorJSON = json["creator"] as? [String: Any],
            let creator = User(json: creatorJSON)
            else { return nil }
        
        self.id = id
        self.name = name
        self.creator = creator
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
    
    init?(jsonDict: [[String : Any]]) {
        return nil
    }
}
