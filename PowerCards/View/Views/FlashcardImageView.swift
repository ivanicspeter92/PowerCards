//
//  FlashcardImageView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 18/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit
import SPUserResizableView_Pion

class FlashcardImageView: UIImageView {
    var card: PowerFlashCard? {
        didSet {
            subviews.forEach({ $0.removeFromSuperview() })
            
            image = card?.image ?? Defaults.cameraIcon
            card?.shapes.forEach({ self.addSubview( ShapeView.instantiate(for: $0, disabled: !enableMovingShapes) )})
        }
    }
    var delegate: FlashcardImageViewDelegate?
    var enableMovingShapes: Bool = false
    
    func wasTapped(at location: CGPoint) {
        let shapeViews = subviews.compactMap({ $0 as? ShapeView})
        
        if let shapeView = shapeViews.first(where: { $0.frame.contains(location) }) {
            self.delegate?.selected(shape: shapeView.shape)
        }
    }
}

protocol FlashcardImageViewDelegate {
    func selected(shape: Shape)
}
