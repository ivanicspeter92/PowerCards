//
//  EditPowerFlashcardViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

class EditPowerFlashcardViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cardImageView: FlashcardImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var toolbarView: ToolbarUIView!
    
    var card: PowerFlashCard!
    var container: PowercardContainer?
    
    private var draggedView: UIView?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCardToView()
        toolbarView.delegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Object to view loaders
    func loadCardToView() {
        loadCardTitleToView()
        loadCardSubTitleToView()
        loadCardImageToView()
    }
    
    func loadCardImageToView() {
        cardImageView.card = card
    }
    
    func loadCardTitleToView() {
        titleTextField.text = card.name
    }
    
    func loadCardSubTitleToView() {
        subTitleTextField.text = card.subTitle
    }
    
    // MARK: Event handlers
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        self.card.image = cardImageView.image
        self.card.name = titleTextField.text ?? ""
        self.card.subTitle = subTitleTextField.text
        self.card.setShapes(to: self.cardImageView.layer.sublayers ?? [])
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        presentDeletePhotoAlert()
    }
    
    @IBAction func handleImagePanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: cardImageView)
//        let translation = sender.translation(in: self.cardImageView)
        if sender.state == UIGestureRecognizerState.began, let view = self.cardImageView.subviews.first(where: { $0.frame.contains(point) }) {
            draggedView = view
            view.center = point
        } else if sender.state == UIGestureRecognizerState.changed {
            draggedView?.center = point
        } else if sender.state == UIGestureRecognizerState.ended {
            draggedView = nil
        }
    }
    
    // MARK: Toolbar event handlers
    func addNewShapeToView() {
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.backgroundColor = UIColor.red
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 3
        
        cardImageView.addSubview(view)
    }
    
    // MARK: Private
    private func presentDeletePhotoAlert() {
        let alert = UIAlertController(title: "Delete Photo", message: nil, preferredStyle: .alert)
       
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] action in
            self?.cardImageView.image = Defaults.cameraIcon
            self?.cardImageView.subviews.forEach({$0.removeFromSuperview()})
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

extension EditPowerFlashcardViewController: ToolbarItemDelegate {
    func didSelect(toolbarItem item: ToolbarItem) {
        switch item {
        case .shape: addNewShapeToView()
        default: return
        }
    }
}
