//
//  User.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 23/05/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

public struct User {
    public let id: Int
    public let name: String
    public let email: String
    
    public init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int, let name = json["name"] as? String, let email = json["email"] as? String else { return nil }
        
        self.id = id
        self.name = name
        self.email = email
    }
}
