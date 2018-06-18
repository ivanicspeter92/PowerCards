//
//  Powerdeck+Hashable.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

extension Powerdeck: Hashable {
    public var hashValue: Int {
        return name.hashValue
    }
    
    public static func ==(lhs: Powerdeck, rhs: Powerdeck) -> Bool {
        return lhs.id == rhs.id
    }
}
