//
//  PowercardList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

public class PowercardList {
    public private(set) var powercards: [Powercard]
    
    public init(powercards: [Powercard]) {
        self.powercards = powercards
    }
    
    public var count: Int {
        return powercards.count
    }
}
