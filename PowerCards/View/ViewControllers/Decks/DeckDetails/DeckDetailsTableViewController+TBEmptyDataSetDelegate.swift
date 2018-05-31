//
//  DeckDetailsTableViewController+TBEmptyDataSetDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import TBEmptyDataSet

extension DeckDetailsTableViewController: TBEmptyDataSetDelegate {
    func emptyDataSetShouldDisplay(in scrollView: UIScrollView) -> Bool {
        return self.powerdeck == nil
    }
}
