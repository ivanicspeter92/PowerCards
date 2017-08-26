//
//  Powercard.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation

struct Powercard {
    let id: String
    let name: String
    let subTitle: String?
//    let creationDate: Date
    let deckID: String?
    let question: String?
    let answers: [Answer]
    
    init(id: String, name: String, subTitle: String? = nil, deckID: String? = nil, question: String? = nil, answers: [Answer] = []) {
        self.id = id
        self.name = name
        self.subTitle = subTitle
//        self.creationDate = Date()
        self.deckID = deckID
        self.question = question
        self.answers = answers
    }
}

extension Powercard: JSONInitializable {
    init?(json: [String : Any]) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String
            else { return nil }
        
        self.id = id
        self.name = name
        self.subTitle = json["subTitle"] as? String
        self.deckID = json["deckID"] as? String
        self.question = json["question"] as? String
        if let answerListJSON = json["answers"] as? [[String: Any]], let answerList = AnswerList(jsonDict: answerListJSON) {
            self.answers = answerList.answers
        } else {
            self.answers = []
        }
    }
    
    init?(jsonDict: [[String : Any]]) {
        return nil
    }
}
