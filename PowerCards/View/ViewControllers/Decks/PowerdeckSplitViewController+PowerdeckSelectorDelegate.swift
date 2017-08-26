//
//  PowerdeckSplitViewController+PowerdeckSelectorDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

extension PowerdecksSplitViewController: PowerdeckSelectorDelegate {
    func selected(powerdeck: Powerdeck) {
        self.deckdetailsViewController.deckDetails = DeckDetailsViewModel(deck: powerdeck)
    }
}
