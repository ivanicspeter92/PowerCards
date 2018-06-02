//
//  PowerFlashCardTests.swift
//  PowerCardsBusinessRulesTests
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

import XCTest
@testable import PowerCardsBusinessRules

class PowerFlashCardTests: XCTestCase {
    func creatingThousandCardsEachHasUniqueIdentifier() {
        let flashcards = Array(0...1000).compactMap({
            PowerFlashCard(name: "Deck \($0)", subTitle: nil)
        })
        
        let ids = flashcards.compactMap({ $0.id })
        
        XCTAssertEqual(Set(ids).count, ids.count)
    }
}
