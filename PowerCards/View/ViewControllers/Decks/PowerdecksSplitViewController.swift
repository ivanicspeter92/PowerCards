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

        // Do any additional setup after loading the view.
        powerdeckListViewController.delegate = self
    }
    
    var powerdeckListViewController: PowerdeckListTableViewController! {
        let master = self.childViewControllers.first
        
        return (master as! UINavigationController).topViewController as! PowerdeckListTableViewController
    }
    
    var deckdetailsViewController: DeckDetailsTableViewController! {
        let detail = self.childViewControllers.last
        
        return (detail as! UINavigationController).topViewController as! DeckDetailsTableViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
