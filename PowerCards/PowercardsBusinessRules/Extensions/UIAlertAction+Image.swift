//
//  UIAlertAction+Image.swift
//  PowerCards
//
//  Created by Peter Ivanics on 22/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

extension UIAlertAction {
    @NSManaged var image : UIImage?
    
    convenience init(title: String?, style: UIAlertActionStyle, image : UIImage?, handler: ((UIAlertAction) -> Swift.Void)? = nil ){
        self.init(title: title, style: style, handler: handler)
        self.image = image
    }
}
