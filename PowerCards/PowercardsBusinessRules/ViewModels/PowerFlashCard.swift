//
//  PowerFlashCard.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

import Foundation
import UIKit

public class PowerFlashCard: Powercard, Flashcard, IDHolder {
    public let id: String
    public var name: String {
        didSet {
            if name != oldValue {
                delegate?.flashcardNameHasChanged()
            }
        }
    }
    public var subTitle: String? {
        didSet {
            if subTitle != oldValue {
                delegate?.flashcardSubtitleHasChanged()
            }
        }
    }
    public let creationDate: Date
    public var image: UIImage? {
        didSet {
            if image != oldValue {
                delegate?.flashcardImageHasChanged()
                // notify delegate or push notification
            }
        }
    }
    public var delegate: PowerFlashCardEditorDelegate?
    public var hasImage: Bool {
        return self.image != nil
    }
    
    public init(name: String, subTitle: String?, image: UIImage?, creationDate: Date = Date(), delegate: PowerFlashCardEditorDelegate? = nil) {
        self.id = UUID.init().uuidString
        self.name = name
        self.subTitle = subTitle
        self.image = image
        self.creationDate = creationDate
        self.delegate = delegate
    }
    
    public convenience init(name: String, subTitle: String?, backgroundColor: UIColor, size: CGSize = UIScreen.main.bounds.size, creationDate: Date = Date()) {
        self.init(name: name, subTitle: subTitle, image: UIImage(color: backgroundColor, size: size), creationDate: creationDate)
    }
    
    public convenience init(name: String, subTitle: String?, size: CGSize = UIScreen.main.bounds.size, creationDate: Date = Date()) {
        self.init(name: name, subTitle: subTitle, backgroundColor: AppSettings.powerFlashCardColor, size: size, creationDate: creationDate)
    }
    
    public func setImageToBlank(withBackground backgroundColor: UIColor = AppSettings.powerFlashCardColor, size: CGSize = UIScreen.main.bounds.size) {
        self.image = UIImage(color: backgroundColor, size: size)
    }
}

public protocol PowerFlashCardEditorDelegate {
    func flashcardNameHasChanged()
    func flashcardSubtitleHasChanged()
    func flashcardImageHasChanged()
}
