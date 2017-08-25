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
    
    private var headers: [String: String] {
        var headers: [String: String] = [:]
        
        headers["content-type"] = "application/json"
        
        return headers
    }
    
    static var shared: RemoteService {
        return singletonObject
    }
    
    func send<R: Request>(request: R) {
        print(#function + "Sending \(type(of: request)) to: \(request.endpoint)\n\(String(describing: request.parameters))")
        
        self.request(request) { (response) in
            print("Response: " + response.debugDescription)
        }
    }
    
    // MARK: Request
    private func request<R: Request>(_ request: R, encoding: URLEncoding = URLEncoding.default, callback: @escaping ((DataResponse<Any>) -> Void)) {
        if request.sendParametersAsForm {
//            sendRequestAsFormData(request, callback: callback)
        } else {
            Alamofire.request(request.endpoint, method: request.method, parameters: request.parameters, encoding: encoding, headers: headers).validate().responseJSON { (response) in
                callback(response)
            }
        }
    }
}
