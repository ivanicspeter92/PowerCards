//
//  ShapeView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 22/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit
import SPUserResizableView_Pion

class ShapeView: SPUserResizableView {
    var shape: Shape! {
        didSet {
            backgroundColor = shape.backgroundColor
            layer.borderWidth = shape.borderWidth
            layer.borderColor = shape.borderColor.cgColor
        }
    }
}
