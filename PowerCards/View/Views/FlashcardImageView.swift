//
//  FlashcardImageView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 18/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class FlashcardImageView: UIImageView {
    var card: PowerFlashCard? {
        didSet {
            subviews.forEach({ $0.removeFromSuperview() })
            
            image = card?.image ?? Defaults.cameraIcon
            card?.shapes.forEach({ self.addSubview( $0.view )})
        }
    }
}
