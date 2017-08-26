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
    
    var decklist: PowerdeckList = PowerdeckList(powerdecks: TestData.testDeckSet,sorting: .byName)
    
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
