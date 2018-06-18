//
//  Answer.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

public struct Answer {
    public let text: String
    public let isCorrect: Bool
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
