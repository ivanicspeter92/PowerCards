//
//  ToolbarItem.swift
//  PowerCards
//
//  Created by Peter Ivanics on 19/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

enum ToolbarItem {
    case resize, rotate, shape, text, draw, crop
    
    static var all: [ToolbarItem] {
        return [.shape, .text, .draw, .rotate, .resize, .crop]
    }
    
    var image: UIImage? {
        switch self {
        case .resize: return UIImage(named: "resize")
        case .rotate: return UIImage(named: "rotate")
        case .shape: return UIImage(named: "rectangle")
        case .text: return UIImage(named: "text")
        case .draw: return UIImage(named: "draw")
        case .crop: return UIImage(named: "crop")
        }
    }
    
    var title: String {
        switch self {
        case .resize: return "Resize"
        case .rotate: return "Rotate"
        case .shape: return "Shape"
        case .text: return "Text"
        case .draw: return "Draw"
        case .crop: return "Crop"
        }
    }
    
    var isEnabled: Bool {
        switch self {
        case .shape: return true
        default: return false
        }
    }
    
    var isSticky: Bool {
        switch self {
//        case .shape: return true
        default: return false
        }
    }
}
