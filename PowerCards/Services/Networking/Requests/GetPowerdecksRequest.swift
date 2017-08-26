//
//  GetPowerdecksRequest.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Alamofire

struct GetPowerdecksRequest: TargetParserRequest {
    typealias Target = Powerdeck
    
    var endpoint: String {
        return Endpoint.getPowerdecks.urlString
    }
    
    var method: HTTPMethod {
        return .get
    }
}
