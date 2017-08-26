//
//  DeckDetailsTableViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

class DeckDetailsTableViewController: UITableViewController, UINavigationControllerDelegate {
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
            self.presentImagePicker(source: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Select a photo", style: .default, handler: { alert in
            self.presentImagePicker(source: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Create a quiz question", style: .default, handler: { alert in
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
    
    private func presentImagePicker(source: UIImagePickerControllerSourceType) {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = self
        
        present(controller, animated: true, completion: nil)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = (segue.destination as? UINavigationController)?.topViewController as? EditPowercardViewController ?? 
            segue.destination as? EditPowercardViewController {
            if let pickedImage = sender as? UIImage {
                destination.card = PowercardViewModel(image: pickedImage)
            }
        }
    }

    func toCreateCardWith(pickedImage: UIImage) {
        performSegue(withIdentifier: "toCreateCard", sender: pickedImage)
    }
}
