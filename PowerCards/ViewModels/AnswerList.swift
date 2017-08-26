//
//  AnswerList.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

struct AnswerList {
    var answers: [Answer]
}

extension AnswerList: JSONInitializable {
    init?(json: [String : Any]) {
        return nil
    }
    
    init?(jsonDict: [[String : Any]]) {
        self.answers = []
        jsonDict.forEach({
            if let answer = Answer(json: $0) {
                self.answers.append(answer)
            }
        })
    }
}
