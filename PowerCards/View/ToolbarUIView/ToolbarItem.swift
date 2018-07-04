//
//  ToolbarItem.swift
//  PowerCards
//
//  Created by Peter Ivanics on 19/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

enum ToolbarItem {
//    case resize
    case rotate
    case shape
    case text
    case draw
    case crop
//    case move
    case delete
    
    static var all: [ToolbarItem] {
        return [
            .shape,
            .text,
            .draw,
            .rotate,
//            .resize,
//            .move,
            .crop,
            .delete
        ]
    }
    
    var image: UIImage? {
        switch self {
//        case .resize: return UIImage(named: "resize")
        case .rotate: return UIImage(named: "rotate")
        case .shape: return UIImage(named: "rectangle")
        case .text: return UIImage(named: "text")
        case .draw: return UIImage(named: "draw")
        case .crop: return UIImage(named: "crop")
//        case .move: return UIImage(named: "move")
        case .delete: return UIImage(named: "delete")
        }
    }
    
    var title: String {
        switch self {
//        case .resize: return "Resize"
        case .rotate: return "Rotate"
        case .shape: return "Shape"
        case .text: return "Text"
        case .draw: return "Draw"
        case .crop: return "Crop"
//        case .move: return "Move"
        case .delete: return "Delete"
        }
    }
    
    var isEnabled: Bool {
        switch self {
        case .shape, .delete: return true
//        case .resize, .move: return true
        default: return false
        }
    }
    
    var isSticky: Bool {
        switch self {
//        case .resize, .move: return true
        case .delete: return true
        default: return false
        }
    }
}
