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
            layer.borderColor = shape.borderColor.cgColor
            layer.borderWidth = shape.borderWidth
        }
    }
    var shapeViewDelegate: ShapeViewDelegate?

    static func instantiate(for shape: Shape, delegate: ShapeViewDelegate? = nil, disabled: Bool = false) -> ShapeView {
        let view = ShapeView()
        
        view.shape = shape
        
        view.minWidth = 10
        view.minHeight = 10
        view.preventsPositionOutsideSuperview = true
        view.disable = disabled
        view.disablePan = disabled
        view.shapeViewDelegate = delegate
        
        return view
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        shapeViewDelegate?.touchesStarted(for: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        shape = Shape(view: self)
        
        shapeViewDelegate?.touchesEnded(for: self)
    }
}

protocol ShapeViewDelegate {
    func touchesStarted(for shapeview: ShapeView)
    func touchesEnded(for shapeview: ShapeView)
}
