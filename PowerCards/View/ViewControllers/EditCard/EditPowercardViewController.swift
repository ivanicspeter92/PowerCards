//
//  EditPowercardViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import CLImageEditor

class EditPowercardViewController: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    
    var card: PowercardViewModel!
    
    private let defaultCameraIcon = UIImage(named: "camera")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImageView.image = card.image ?? defaultCameraIcon
        cardImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func imageTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if card.image != nil {
            alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (action) in
                self.present(CLImageEditor(image: self.cardImageView.image)!, animated: true, completion: nil)
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
}
