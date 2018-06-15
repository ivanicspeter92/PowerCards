//
//  DeckDetailsTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

class DeckDetailsTableViewController: UITableViewController {
    @IBOutlet weak var takeQuizButton: UIBarButtonItem!
    @IBOutlet weak var addCardButton: UIBarButtonItem!
    
    var powerdeck: Powerdeck? {
        willSet {
            refreshControl?.endRefreshing()
        } didSet {
            if powerdeck != oldValue {
                tableView.reloadData()
            }
            loadDeckTitleToView()
            
            takeQuizButton.isEnabled = powerdeck != nil && powerdeck?.cards.count != 0
            addCardButton.isEnabled = powerdeck != nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetDataSource = self
        tableView.emptyDataSetDelegate = self
       
        takeQuizButton.isEnabled = false
        addCardButton.isEnabled = false
        navigationItem.rightBarButtonItems = [addCardButton, takeQuizButton]
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckNameChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.deckNameChanged.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deckRemovedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.deckDeleted.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(newCardWasAddedToDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.newCardWasAddedToDeck.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(cardWasRemovedFromDeckNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.cardWasRemovedFromDeck.rawValue), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Event handlers
    @IBAction func addCardButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add card", message: nil, preferredStyle: .actionSheet)
        alert.popoverPresentationController?.barButtonItem = addCardButton
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { alert in
            self.presentImagePicker(source: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Select a photo", style: .default, handler: { alert in
            self.presentImagePicker(source: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Create a blank card", style: .default, handler: { alert in
            self.createNewBlankCard()
        }))
        alert.addAction(UIAlertAction(title: "Type text", style: .default, handler: { alert in
            self.presentNoteMaker()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func takeQuizButtonTapped(_ sender: UIBarButtonItem) {
        guard let deck = powerdeck else { return }

        let alert = UIAlertController(title: "Study", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.popoverPresentationController?.barButtonItem = takeQuizButton
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Crunch Mode", style: .default, handler: { [weak self] action in
            
        }))
        alert.addAction(UIAlertAction(title: "Spaced Repetition", style: .default, handler: { [weak self] action in
            
        }))
        
        
        present(alert, animated: true)
    }
    
    // MARK: Notification listeners
    @objc func deckNameChangedNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        loadDeckTitleToView()
    }
    
    @objc func deckRemovedNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        self.powerdeck = nil
        tableView.reloadData()
    }
    
    @objc func newCardWasAddedToDeckNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        loadDeckTitleToView()
        tableView.reloadData()
    }
    
    @objc func cardWasRemovedFromDeckNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.powerdeck else { return }
        
        loadDeckTitleToView()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = (segue.destination as? UINavigationController)?.topViewController as? EditPowerFlashcardViewController ?? segue.destination as? EditPowerFlashcardViewController {
            if let card = sender as? PowerFlashCard {
                destination.card = card
                destination.container = self.powerdeck
            } else {
                // handle error
            }
        } else if let destination = (segue.destination as? UINavigationController)?.topViewController as? QuizViewController ?? segue.destination as? QuizViewController {
            destination.deckDetails = powerdeck
        }
    }
    
    func toCard(card: Powercard) {
        if let card = card as? PowerFlashCard {
            performSegue(withIdentifier: "toEditFlashcard", sender: card)
        }
    }
    
    // MARK: Other methods
    func presentRenameDeckDialog(for card: Powercard) {
        let alert = UIAlertController(title: "Rename Card", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.text = card.name
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [unowned alert] action in
            if let textfield = alert.textFields?.first, let newTitle = textfield.text {
                card.name = newTitle
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private
    private func loadDeckTitleToView() {
        guard let powerdeck = powerdeck else { addTitle(text: nil); return }
        
        addTitle(text: (powerdeck.name) + " (\(powerdeck.cards.count) cards)")
    }
    
    private func addTitle(text: String?) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    private func presentImagePicker(source: UIImagePickerControllerSourceType) {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = self
        
        present(controller, animated: true, completion: nil)
    }
    
    private func createNewBlankCard() {
        let card = PowerFlashCard(name: "New card", subTitle: nil)
        toCard(card: card)
    }
    
    private func presentNoteMaker() {
    }
}
