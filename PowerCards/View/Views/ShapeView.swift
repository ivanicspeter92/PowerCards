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
            frame = shape.frame
            backgroundColor = shape.backgroundColor
            layer.borderColor = shape.borderColor.cgColor
            layer.borderWidth = shape.borderWidth
        }
    }
    
    static func instantiate(for shape: Shape, disabled: Bool = false) -> ShapeView {
        let view = ShapeView()
        
        view.shape = shape
        
        view.minWidth = 10
        view.minHeight = 10
        view.preventsPositionOutsideSuperview = true
        view.disable = disabled
        view.disablePan = disabled
        
        return view
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if shape.frame != frame {
            shape.frame = frame
        }
    }
}
