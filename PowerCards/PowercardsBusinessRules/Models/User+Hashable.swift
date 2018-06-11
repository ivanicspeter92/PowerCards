//
//  User+Hashable.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 23/05/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

import Foundation

extension User: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
    
    public static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
