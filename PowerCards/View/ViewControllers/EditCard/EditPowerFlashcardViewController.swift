//
//  EditPowerFlashcardViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import CLImageEditor
import Foundation

class EditPowerFlashcardViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var card: PowerFlashCard!
    var container: PowercardContainer?
    
    private let defaultCameraIcon = UIImage(named: "camera")
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCardToView()
        cardImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
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
        if let image = card.image {
            cardImageView.image = image
            loadCardShapesToView()
        } else {
            cardImageView.image = defaultCameraIcon
        }
    }
    
    private func loadCardShapesToView() {
        card.shapes.forEach({
            cardImageView.layer.addSublayer($0.layer)
        })
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
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        presentDeletePhotoAlert()
    }
    
    @objc func imageTapped() {
        let alert = UIAlertController(title: "Image Tools", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { [weak self] action in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            
            self?.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Select a photo", style: .default, handler: { [weak self] action in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self?.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Create a blank card", style: .default, handler: { [weak self] action in
            self?.card.setImageToBlank()
        }))
        if self.card.hasImage && cardImageView.image != defaultCameraIcon {
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] action in
                self?.presentDeletePhotoAlert()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.popoverPresentationController?.sourceView = cardImageView
        alert.popoverPresentationController?.sourceRect = cardImageView.bounds
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handleImagePanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: cardImageView)
        
        if let layer = self.cardImageView.layer.sublayers?.first(where: { layer in
            layer.hitTest(point) != nil
        }) {
            layer.position = point
        }
    }
    
    // MARK: Toolbar event handlers
    @IBAction func shapeButtonTapped(_ sender: UIButton) {
        let layer = CAShapeLayer()
        
        layer.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        layer.backgroundColor = UIColor.red.cgColor
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        
        cardImageView.layer.addSublayer(layer)
    }
    
    @IBAction func rotateButtonTapped(_ sender: UIButton) {
        print("Rotate")
    }
    
    // MARK: Private
    private func presentDeletePhotoAlert() {
        let alert = UIAlertController(title: "Delete Photo", message: nil, preferredStyle: .alert)
        
       
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] action in
            self?.cardImageView.image = self?.defaultCameraIcon
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
