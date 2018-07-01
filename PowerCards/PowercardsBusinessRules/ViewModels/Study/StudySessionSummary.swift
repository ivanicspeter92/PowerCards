//
//  StudySessionSummary.swift
//  PowerCards
//
//  Created by Peter Ivanics on 28/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

public struct StudySessionSummary {
    let results: [ResultOnCardShape]
    
    var noResults: [ResultOnCardShape] {
        return results.filter({
            $0.result == nil
        })
    }
    
    var greenResults: [ResultOnCardShape] {
        return results.filter({
            $0.result == StudyModeResult.green
        })
    }
    
    var yellowResults: [ResultOnCardShape] {
        return results.filter({
            $0.result == StudyModeResult.yellow
        })
    }
    
    var redResults: [ResultOnCardShape] {
        return results.filter({
            $0.result == StudyModeResult.red
        })
    }
    
    public func results(for studyModeResult: StudyModeResult?) -> [ResultOnCardShape] {
        switch studyModeResult {
        case .none: return noResults
        case .some(let result):
            switch result {
            case .red: return redResults
            case .yellow: return yellowResults
            case .green: return greenResults
            }
        }
    }
}
