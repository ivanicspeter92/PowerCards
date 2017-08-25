//
//  Request.swift
//  Powercards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Alamofire

protocol Request: URLRequestConvertible {
//    associatedtype P: Parser
    
    var endpoint: String { get }
    var parameters: [String: Any] { get }
    var method: Alamofire.HTTPMethod { get }
//    var parser: P { get }
    var sendParametersAsForm: Bool { get }
}

extension Request {
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        urlRequest.httpMethod = method.rawValue
    
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var sendParametersAsForm: Bool {
        return false
    }
}
