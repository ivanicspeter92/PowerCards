//
//  PowerdeckListTableViewController+UISplitViewControllerDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 03/09/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

extension PowerdeckListTableViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
