//
//  DeckDetailsTableViewController+TBEmptyDataSetDataSource.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import TBEmptyDataSet

extension DeckDetailsTableViewController: TBEmptyDataSetDataSource {
    func imageForEmptyDataSet(in scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "powercards_logo_transparent")
    }
    
//    func descriptionForEmptyDataSet(in scrollView: UIScrollView) -> NSAttributedString? {
//        return NSAttributedString(string: "No deck selected :(")
//    }
    
    func verticalOffsetForEmptyDataSet(in scrollView: UIScrollView) -> CGFloat {
        return -50.0
    }
}
