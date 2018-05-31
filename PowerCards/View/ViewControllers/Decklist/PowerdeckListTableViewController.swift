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
    var decklist: PowerdeckList = PowerdeckList(owner: TestData.testUser)
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            delegate = self
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckNameChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.deckNameChanged.rawValue), object: nil)
    }

    // MARK: Event handlers
    @IBAction func addDeckButtonTapped(_ sender: UIBarButtonItem) {
        let deck = Powerdeck(id: "\(arc4random())", name: "Deck", creator: TestData.testUser)
        
        tableView.beginUpdates()
        let updatedIndex = decklist.addNewDeck(deck: deck)
        tableView.insertRows(at: [updatedIndex], with: .automatic)
        tableView.endUpdates()
    }
    
    // MARK: Notification listeners
    @objc func deckNameChangedNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, decklist.contains(deck: deck) else { return }
        
        tableView.reloadData()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let deckDetailsVC = (segue.destination as? UINavigationController)?.topViewController as? DeckDetailsTableViewController, let powerdeck = sender as? Powerdeck {
            deckDetailsVC.powerdeck = powerdeck
        }
    }
}
