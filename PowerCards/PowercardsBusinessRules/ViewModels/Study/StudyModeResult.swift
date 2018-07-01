//
//  StudyModeResult.swift
//  PowerCards
//
//  Created by Peter Ivanics on 24/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

public enum StudyModeResult {
    case red, yellow, green
    
    public static var all: [StudyModeResult] {
        return [StudyModeResult.red, StudyModeResult.yellow, StudyModeResult.green]
    }
    
    public var title: String {
        switch self {
        case .red: return "Wrong"
        case .yellow: return "Okay"
        case .green: return "Perfect"
        }
    }
    
    public var image: UIImage? {
        switch self {
        case .red: return UIImage(named: "angry_face")
        case .yellow: return UIImage(named: "bored_face")
        case .green: return UIImage(named: "happy_face")
        }
    }
}
