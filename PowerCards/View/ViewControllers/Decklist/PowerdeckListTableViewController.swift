//
//  PowerdeckListTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

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
        TestData.testDeckSet.forEach({
            _ = self.decklist.addNewDeck(deck: $0)
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckNameChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.deckNameChanged.rawValue), object: nil)
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
    
    // MARK: Other methods
    func presentRenameDeckDialog(for deck: Powerdeck) {
        let alert = UIAlertController(title: "Rename Deck", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.text = deck.name
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [unowned alert] action in
            if let textfield = alert.textFields?.first, let newTitle = textfield.text {
                deck.name = newTitle
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
