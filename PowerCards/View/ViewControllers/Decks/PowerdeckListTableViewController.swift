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
    var decklist: PowerdeckList = PowerdeckList() {
        didSet {
            tableView.reloadData()
            refreshControl?.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        fetchFromServer()
        
        refreshControl?.addTarget(self, action: #selector(fetchFromServer), for: .valueChanged)
    }

    @IBAction func addDeckButtonTapped(_ sender: UIBarButtonItem) {
        let deck = Powerdeck(id: "\(arc4random())", name: "Deck #\(decklist.count + 1)", cards: 0)
        
        decklist.prepend(deck: deck)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func fetchFromServer() {
        let request = GetPowerdecksRequest()
        
        refreshControl?.beginRefreshing()
        RemoteService.shared.send(request: request) { decks in
            self.decklist = decks
        }
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
