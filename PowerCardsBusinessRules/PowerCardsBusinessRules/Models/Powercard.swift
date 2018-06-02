//
//  Powercard.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

public protocol Powercard: IDHolder {
    var id: String { get }
    var name: String { get }
    var subTitle: String? { get }
    var creationDate: Date { get }
}
