//
//  Endpoint.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

enum Endpoint {
    case createPowerdeck, getPowerdecks
    
    var urlString: String {
        switch self {
        case .createPowerdeck: return AppSettings.hostname + "/powerdeck/"
        case .getPowerdecks: return AppSettings.hostname + "/powerdeck/"
        }
    }
}
