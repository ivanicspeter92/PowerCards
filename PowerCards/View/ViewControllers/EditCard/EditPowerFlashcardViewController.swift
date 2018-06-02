//
//  EditPowerFlashcardViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import CLImageEditor
import PowerCardsBusinessRules

class EditPowerFlashcardViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var subTitleTextView: UITextView!
    
    var card: PowerFlashCard!
    var container: PowercardContainer?
    
    private let defaultCameraIcon = UIImage(named: "camera")
    
    // MARK: From superclass
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.delegate = self
        
        loadCardToView()
        cardImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    // MARK: Object to view loaders
    func loadCardToView() {
        loadCardTitleToView()
        loadCardSubTitleToView()
        loadCardImageToView()
    }
    
    func loadCardImageToView() {
        cardImageView.image = card.image ?? defaultCameraIcon
    }
    
    func loadCardTitleToView() {
        titleTextView.text = card.name
    }
    
    func loadCardSubTitleToView() {
        subTitleTextView.text = card.subTitle
    }
    
    // MARK: Event handlers
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        container?.insertOrUpdate(card: self.card)
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func imageTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if card.image != nil {
            alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (action) in
                self.showImageEditor()
            }))
            alert.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { action in
                self.cardImageView.image = self.defaultCameraIcon
                self.card.image = nil
            }))
        } else {
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
                let picker = UIImagePickerController()
                picker.delegate = self
                
                self.present(picker, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.popoverPresentationController?.sourceView = cardImageView
        alert.popoverPresentationController?.sourceRect = cardImageView.bounds
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private
    private func showImageEditor() {
        guard let editor = CLImageEditor(image: self.cardImageView.image) else { return } // handle error
        let disabledTools: Set<CLImageToolKeys> = [.adjustment, .blur, .effect, .filter, .toneCurve]
        
        editor.delegate = self
        disabledTools.forEach({
            if let toolInfo = editor.toolInfo.subToolInfo(withToolName: $0.rawValue, recursive: true) {
                toolInfo.available = false
            }
        })
        if let stickerToolInfo = editor.toolInfo.subToolInfo(withToolName: CLImageToolKeys.sticker.rawValue, recursive: true) {
            stickerToolInfo.title = "Peek-a-boo"
        }
        
        present(editor, animated: true, completion: nil)
    }
}

extension EditPowerFlashcardViewController: CLImageEditorDelegate {
    func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        self.card.image = image
        editor.dismiss(animated: true, completion: nil)
    }
    
    func imageEditorDidCancel(_ editor: CLImageEditor!) {
         editor.dismiss(animated: true, completion: nil)
    }
}

extension EditPowerFlashcardViewController: PowerFlashCardEditorDelegate {
    func flashcardNameHasChanged() {
        loadCardTitleToView()
    }
    
    func flashcardSubtitleHasChanged() {
        loadCardSubTitleToView()
    }
    
    func flashcardImageHasChanged() {
        loadCardImageToView()
    }
}

extension EditPowerFlashcardViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == titleTextView {
            self.card.name = textView.text
        } else if textView == subTitleTextView {
            self.card.subTitle = textView.text
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == titleTextView && text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
