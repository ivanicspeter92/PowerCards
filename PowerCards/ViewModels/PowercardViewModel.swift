//
//  PowercardViewModel.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

struct PowercardViewModel {
    var image: UIImage?
    var name: String
    var subtitle: String
    
    init(image: UIImage? = nil, name: String = "", subtitle: String = "") {
        self.image = image
        self.name = name
        self.subtitle = subtitle
    }
}
