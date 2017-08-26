//
//  JSONInitialziable.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

protocol JSONInitializable {
    init?(json: [String: Any])
    init?(jsonDict: [[String: Any]])
}
