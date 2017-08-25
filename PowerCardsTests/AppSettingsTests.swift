//
//  AppSettingsTests.swift
//  PowerCardsTests
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

@testable import PowerCards
import XCTest

class AppSettingsTests: XCTestCase {
    func testServerAddressReturnsCorrectAddress() {
        XCTAssertEqual("10.112.49.111", AppSettings.serverAddress)
    }
}
