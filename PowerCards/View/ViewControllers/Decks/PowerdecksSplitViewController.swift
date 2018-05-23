//
//  PowerdecksSplitViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

class PowerdecksSplitViewController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice.current.userInterfaceIdiom == .pad {
            powerdeckListViewController.delegate = self
        }
        preferredDisplayMode = .allVisible
    }
    
    var powerdeckListViewController: PowerdeckListTableViewController! {
        let master = masterViewController
        
        return (master as! UINavigationController).topViewController as! PowerdeckListTableViewController
    }
    
    var deckdetailsViewController: DeckDetailsTableViewController? {
        if let detail = detailViewController as? DeckDetailsTableViewController {
            return detail
        } else if let navigation = detailViewController as? UINavigationController, let detail = navigation.topViewController as? DeckDetailsTableViewController {
            return detail
        } else {
            return nil
        }
    }
}
