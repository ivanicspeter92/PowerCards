//
//  EditPowerFlashcardViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation
import SPUserResizableView_Pion

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
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.enableMovingShapes = true
        cardImageView.delegate = self
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
    
    // MARK: View to object
    func loadViewStateToCardFields() {
        card.image = cardImageView.image
        card.name = titleTextField.text ?? ""
        card.subTitle = subTitleTextField.text
        card.setShapes(to: cardImageView.subviews)
    }
    
    // MARK: Event handlers
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        loadViewStateToCardFields()
        
        if container?.contains(card: card) == false {
            container?.insert(card: card)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        presentDeletePhotoAlert()
    }
    
    // MARK: Event handlers
    @IBAction func cardImageViewWasTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: cardImageView)
        
        cardImageView.wasTapped(at: point)
    }
    
    
    // MARK: Toolbar event handlers
    func addNewShapeToView() {
        let view = ShapeView.instantiate(for: Shape(frame: CGRect(x: 0, y: 0, width: 200, height: 50), backgroundColor: UIColor.red, borderColor: UIColor.black, borderWidth: 3))
        
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

extension EditPowerFlashcardViewController: ToolbarDelegate {
    func didSelect(item: ToolbarItem) {
        switch item {
        case .shape: addNewShapeToView()
        default: return
        }
    }
    
    func didDeselect(item: ToolbarItem) {
        switch item {
        default: return 
        }
    }
}

extension EditPowerFlashcardViewController: FlashcardImageViewDelegate {
    func selected(shape: Shape) {
        guard let activeToolbarItem = toolbarView.activeToolbarItem else { return }
        
        switch activeToolbarItem {
        case .delete: card.remove(shape: shape)
        default: return
        }
    }
}
