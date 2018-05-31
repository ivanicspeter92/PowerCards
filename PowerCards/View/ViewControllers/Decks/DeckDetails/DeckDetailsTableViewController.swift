//
//  DeckDetailsTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import PKHUD
import PowerCardsBusinessRules

class DeckDetailsTableViewController: UITableViewController {
    @IBOutlet weak var renameDeckButton: UIBarButtonItem!
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
            renameDeckButton.isEnabled = powerdeck != nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetDataSource = self
        tableView.emptyDataSetDelegate = self
       
        renameDeckButton.isEnabled = false
        takeQuizButton.isEnabled = false
        addCardButton.isEnabled = false
        navigationItem.rightBarButtonItems = [addCardButton, renameDeckButton, takeQuizButton]
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckNameChangedNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.deckNameChanged.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deckRemovedNotificationReceived(_:)), name: NSNotification.Name(rawValue: PowerCardsBusinessRules.NotificationKeys.deckDeleted.rawValue), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Event handlers
    @IBAction func renameDeckButtonTapped(_ sender: UIBarButtonItem) {
        presentRenameDialog()
    }
    
    @IBAction func addCardButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add card", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { alert in
            self.presentImagePicker(source: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Select a photo", style: .default, handler: { alert in
            self.presentImagePicker(source: .photoLibrary)
        }))
        alert.popoverPresentationController?.barButtonItem = addCardButton
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func takeQuizButtonTapped(_ sender: UIBarButtonItem) {
        guard let deck = powerdeck else { HUD.show(.labeledError(title: "No deck selected!", subtitle: nil)); return }
        
        toTakeQuiz(deckDetails: deck)
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
    
    private func presentRenameDialog() {
        let alert = UIAlertController(title: "Rename Deck", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.text = self.powerdeck?.name
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [unowned alert] action in
            if let textfield = alert.textFields?.first, let newTitle = textfield.text {
                self.powerdeck?.name = newTitle
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentImagePicker(source: UIImagePickerControllerSourceType) {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = self
        
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = (segue.destination as? UINavigationController)?.topViewController as? EditPowercardViewController ?? segue.destination as? EditPowercardViewController {
            if let pickedImage = sender as? UIImage {
                destination.card = PowercardViewModel(image: pickedImage)
            }
        } else if let destination = (segue.destination as? UINavigationController)?.topViewController as? QuizViewController ?? segue.destination as? QuizViewController {
            destination.deckDetails = powerdeck
        }
    }

    func toCreateCardWith(pickedImage: UIImage) {
        performSegue(withIdentifier: "toCreateCard", sender: pickedImage)
    }
    
    func toTakeQuiz(deckDetails: Powerdeck) {
        performSegue(withIdentifier: "toQuiz", sender: deckDetails)
    }
}
