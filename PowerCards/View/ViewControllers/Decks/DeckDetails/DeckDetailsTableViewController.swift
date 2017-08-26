//
//  DeckDetailsTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

class DeckDetailsTableViewController: UITableViewController {
    @IBOutlet weak var takeQuizButton: UIBarButtonItem!
    @IBOutlet weak var addCardButton: UIBarButtonItem!
    
    var deck: Powerdeck? {
        didSet {
            tableView.reloadData()
            self.addTitle(text: deck?.name)
            
            takeQuizButton.isEnabled = deck?.cards != nil && deck?.cards.count != 0
            addCardButton.isEnabled = deck != nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetDataSource = self
        tableView.emptyDataSetDelegate = self
       
        takeQuizButton.isEnabled = false
        addCardButton.isEnabled = false
        navigationItem.rightBarButtonItems = [addCardButton, takeQuizButton]
        
        NotificationCenter.default.addObserver(self, selector: #selector(deckRemovedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.DeckDeletedNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Event handlers
    @IBAction func addCardButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add card", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { alert in
            self.presentImagePicker()
        }))
        alert.addAction(UIAlertAction(title: "Free text", style: .default, handler: { alert in
            self.presentImagePicker()
        }))
        alert.addAction(UIAlertAction(title: "Create a quiz question", style: .default, handler: { alert in
            self.presentImagePicker()
        }))
        alert.popoverPresentationController?.barButtonItem = addCardButton
        
        present(alert, animated: true, completion: nil)
    }
    
    func deckRemovedNotificationReceived(_ notification: Notification) {
        guard let deck = notification.object as? Powerdeck, deck == self.deck else { return }
        
        self.deck = nil
        tableView.reloadData()
    }
    
    // MARK: Private
    private func addTitle(text: String?) {
        //            title = deck?.name
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    private func presentImagePicker() {
        
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
