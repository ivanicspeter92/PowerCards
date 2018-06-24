//
//  UserSession.swift
//  PowerCards
//
//  Created by Peter Ivanics on 24/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

class UserSession {
    static let shared: UserSession = UserSession()
    private(set) var currentUser: User?
    
    var hasValidSession: Bool {
        return currentUser != nil
    }
    
    private init() {
    }
    
    func establishUserSession(for user: User) {
        currentUser = user
    }
    
    func terminateUserSession() {
        currentUser = nil
    }
}
