//
//  SPUserResizableView+Shape.swift
//  PowerCards
//
//  Created by Peter Ivanics on 22/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import Foundation
import SPUserResizableView_Pion

extension SPUserResizableView {
    static func instantiate(for shape: Shape) -> SPUserResizableView {
        let view = SPUserResizableView()
        
        view.frame = shape.frame
        view.backgroundColor = shape.backgroundColor
        view.layer.borderColor = shape.borderColor.cgColor
        view.layer.borderWidth = shape.borderWidth
        view.minWidth = 10
        view.minHeight = 10
        view.preventsPositionOutsideSuperview = true
        
        return view
    }
}
