//
//  DeckDetailsTableViewController+UIImagePickerControllerDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

extension DeckDetailsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let card = PowerFlashCard(name: "New flashcard", subTitle: nil, image: pickedImage)
            toCard(card: card)
        }
    }
}
