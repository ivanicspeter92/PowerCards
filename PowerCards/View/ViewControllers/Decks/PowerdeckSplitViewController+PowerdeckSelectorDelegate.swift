//
//  PowerdeckSplitViewController+PowerdeckSelectorDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import PowerCardsBusinessRules

extension PowerdecksSplitViewController: PowerdeckSelectorDelegate {
    func selected(powerdeck: Powerdeck) {
        deckdetailsViewController?.deckDetails = DeckDetailsViewModel(deck: powerdeck)
    }
}
