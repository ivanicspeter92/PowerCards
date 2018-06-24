//
//  Powercard.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

public protocol Powercard: class, IDHolder {
    var name: String { get set }
    var subTitle: String? { get set }
    var image: UIImage? { get set } 
    var creationDate: Date { get }
}

func ==(lhs: Powercard, rhs: Powercard) -> Bool {
    guard type(of: lhs) == type(of: rhs) else { return false }
    return lhs.id == rhs.id && lhs.name == rhs.name && lhs.subTitle == rhs.subTitle && lhs.image == rhs.image && lhs.creationDate == rhs.creationDate
}
