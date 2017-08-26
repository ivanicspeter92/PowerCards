//
//  PowerdeckListTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

class PowerdeckListTableViewController: UITableViewController {
    var delegate: PowerdeckSelectorDelegate?
    
    var decklist: PowerdeckList = PowerdeckList(powerdecks: [
        Powerdeck(name: "Test", cards: [
            Powercard(id: "1", name: "bla"),
            Powercard(id: "2", name: "blabla")
            ]),
        Powerdeck(name: "Test deck 2", cards: [
            Powercard(id: "3", name: "BLA"),
            Powercard(id: "4", name: "BLABLA")
            ], isShared: true)
        ],sorting: .byName)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
