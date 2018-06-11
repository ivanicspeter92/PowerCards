//
//  IDHolder.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

public protocol IDHolder: Equatable {
    var id: String { get }
}

public func ==<T: IDHolder>(lhs: T, rhs: T) -> Bool {
    return lhs.id == rhs.id
}
