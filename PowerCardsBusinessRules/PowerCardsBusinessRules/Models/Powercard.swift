//
//  Powercard.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

public protocol Powercard {
    var name: String { get set }
    var subTitle: String? { get set }
    var image: UIImage? { get set } 
    var creationDate: Date { get }
}
