//
//  Powercard+Hashable.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

extension Powercard: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
    
    public static func ==(lhs: Powercard, rhs: Powercard) -> Bool {
        return lhs.id == rhs.id
    }
}
