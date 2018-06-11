//
//  PowerdeckListTableViewController+PowerdeckSelectorDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 03/09/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

extension PowerdeckListTableViewController: PowerdeckSelectorDelegate {
    func selected(powerdeck: Powerdeck) {
        performSegue(withIdentifier: "toDeckDetails", sender: powerdeck)
    }
}
