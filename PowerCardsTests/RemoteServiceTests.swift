//
//  RemoteServiceTests.swift
//  PowerCardsTests
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import XCTest
@testable import PowerCards

class RemoteServiceTests: XCTestCase {
    func testSendindCreatePowerdeckRequest() {
        let request = CreatePowerdeckRequest()
        
        RemoteService.shared.send(request: request)
    }
}
