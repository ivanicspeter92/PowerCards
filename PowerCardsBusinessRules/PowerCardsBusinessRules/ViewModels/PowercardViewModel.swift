//
//  PowercardViewModel.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

public struct PowercardViewModel {
    public var image: UIImage?
    public var name: String
    public var subtitle: String
    
    public init(image: UIImage? = nil, name: String = "", subtitle: String = "") {
        self.image = image
        self.name = name
        self.subtitle = subtitle
    }
}
