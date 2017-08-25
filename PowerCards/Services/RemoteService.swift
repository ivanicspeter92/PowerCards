//
//  RemoteService.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Alamofire

struct RemoteService {
    private static let singletonObject = RemoteService()
    
    private init() {
    }
    
    static var shared: RemoteService {
        return singletonObject
    }
}
