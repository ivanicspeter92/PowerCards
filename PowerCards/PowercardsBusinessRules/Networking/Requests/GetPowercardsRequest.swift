//
//  GetPowercardsRequest.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Alamofire

struct GetPowercardsRequest: TargetParserRequest {
    typealias Target = PowercardList
    
    let id: String
    
    var endpoint: String {
        return Endpoint.getPowercards(deckID: id).urlString
    }
    
    var method: HTTPMethod {
        return .get
    }
}
