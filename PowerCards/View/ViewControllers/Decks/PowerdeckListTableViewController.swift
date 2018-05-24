//
//  PowerdeckListTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import PowerCardsBusinessRules

class PowerdeckListTableViewController: UITableViewController {
    var delegate: PowerdeckSelectorDelegate?
    var decklist: PowerdeckList = PowerdeckList()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(fetchFromServer), for: .valueChanged)
        splitViewController?.delegate = self
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            delegate = self
        }
        
        fetchFromServer()
    }

    // MARK: Event handlers
    @IBAction func addDeckButtonTapped(_ sender: UIBarButtonItem) {
        let deck = Powerdeck(id: "\(arc4random())", name: "Deck #\(decklist.count + 1)", creator: TestData.testUser, cards: 0)
        
        tableView.beginUpdates()
        decklist.prepend(deck: deck)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func fetchFromServer() {
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let deckDetailsVC = (segue.destination as? UINavigationController)?.topViewController as? DeckDetailsTableViewController, let powerdeck = sender as? Powerdeck {
            deckDetailsVC.deckDetails = DeckDetailsViewModel(deck: powerdeck)
        }
    }
}
