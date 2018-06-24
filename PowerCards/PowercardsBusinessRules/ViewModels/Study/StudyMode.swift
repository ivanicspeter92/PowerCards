//
//  StudyMode.swift
//  PowerCards
//
//  Created by Peter Ivanics on 16/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

enum StudyMode {
    case crunch, spacedRepetition
    
    var shouldShowResultPickerAfterSelectingShape: Bool {
        switch self {
        case .crunch, .spacedRepetition: return true
        }
    }
}
