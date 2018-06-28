//
//  StudyModeResult.swift
//  PowerCards
//
//  Created by Peter Ivanics on 24/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

enum StudyModeResult {
    case red, yellow, green
    
    static var all: [StudyModeResult] {
        return [StudyModeResult.green, StudyModeResult.yellow, StudyModeResult.red]
    }
    
    var title: String {
        switch self {
        case .red: return "I'll keep on trying!"
        case .yellow: return "I'd need to see this one again"
        case .green: return "Confidently perfect"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .red: return UIImage(named: "angry_face")
        case .yellow: return UIImage(named: "bored_face")
        case .green: return UIImage(named: "happy_face")
        }
    }
}
