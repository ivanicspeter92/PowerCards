//
//  Answer.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

struct Answer {
    let text: String
    let isCorrect: Bool
}

extension Answer: JSONInitializable {
    init?(json: [String : Any]) {
        guard let text = json["question"] as? String else { return nil }
        
        self.text = text
        self.isCorrect = json["isCorrect"] as? Bool ?? false
    }
    
    init?(jsonDict: [[String : Any]]) {
        return nil
    }
}
