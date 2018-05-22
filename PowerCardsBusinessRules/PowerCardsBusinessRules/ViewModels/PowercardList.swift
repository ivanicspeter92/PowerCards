//
//  PowercardList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

public struct PowercardList {
    public private(set) var powercards: [Powercard]
    
    public var count: Int {
        return powercards.count
    }
}

extension PowercardList: JSONInitializable {
    init?(json: [String : Any]) {
        return nil
    }
    
    init?(jsonDict: [[String : Any]]) {
        self.powercards = []
        
        jsonDict.forEach({
            if let deck = Powercard(json: $0) {
                self.powercards.append(deck)
            }
        })
    }
    
    
}
