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
    var decklist: PowerdeckList = PowerdeckList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(fetchFromServer), for: .valueChanged)
        
        fetchFromServer()
    }

    @IBAction func addDeckButtonTapped(_ sender: UIBarButtonItem) {
        let deck = Powerdeck(id: "\(arc4random())", name: "Deck #\(decklist.count + 1)", cards: 0)
        
        tableView.beginUpdates()
        decklist.prepend(deck: deck)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func fetchFromServer() {
        let request = GetPowerdecksRequest()
        
        refreshControl?.beginRefreshing()
        RemoteService.shared.send(request: request) { decks in
            self.refreshControl?.endRefreshing()
            self.decklist = decks
            self.tableView.reloadData()
        }
    }
}
