//
//  PowerdeckType.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 23/05/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

public enum PowerdeckType {
    case own
    case otherUsers
    
    static public var all: [PowerdeckType] {
        return [.own, .otherUsers]
    }
    
    public var name: String {
        switch self {
        case .own: return "My own"
        case .otherUsers: return "By others"
        }
    }
}
