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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = view
        
        return view
    }
    
//    func enableDragging() {
//        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(viewWasDragged(_:))))
//    }
//    
//    @objc func viewWasDragged(_ gesture: UIPanGestureRecognizer) {
//        print(gesture)
//        
//        switch gesture.state {
//        case .began:
//            shapeViewDelegate?.touchesStarted(for: self)
//        case .changed:
//            let translation = gesture.translation(in: self)
//            self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
//            gesture.setTranslation(CGPoint.zero, in: self)
//        case .ended, .cancelled:
//            shape = Shape(view: self)
//            shapeViewDelegate?.touchesEnded(for: self)
//        default: return
//        }
//    }
}

extension ShapeView: SPUserResizableViewDelegate {
    func userResizableViewDidBeginEditing(_ userResizableView: SPUserResizableView!) {
        shapeViewDelegate?.touchesStarted(for: self)
    }
    
    func userResizableViewDidEndEditing(_ userResizableView: SPUserResizableView!) {
        shape = Shape(view: self)
        shapeViewDelegate?.touchesEnded(for: self)
    }
}

protocol ShapeViewDelegate {
    func touchesStarted(for shapeview: ShapeView)
    func touchesEnded(for shapeview: ShapeView)
}
