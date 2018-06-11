//
//  CreatePowerDeckRequest.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Alamofire

struct CreatePowerdeckRequest: Request {
//    typealias P = <#ResponseParser#>
    
    var endpoint: String {
        return Endpoint.createPowerdeck.urlString
    }
    
    var method: HTTPMethod {
        return .post
    }
    
//    var parser: <#ResponseParser#> {
//        return <#ResponseParser#>()
//    }
}
