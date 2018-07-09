//
//  PowerFlashCard.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

import Foundation
import UIKit

typealias ShapeRemovalTuple = (card: PowerFlashCard, shape: Shape)

public class PowerFlashCard: Powercard, Flashcard, IDHolder {
    public let id: String
    public var name: String {
        didSet {
            if name != oldValue {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.cardNameChanged.rawValue), object: self, userInfo: nil))
            }
        }
    }
    public var subTitle: String? {
        didSet {
            if subTitle != oldValue {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.cardSubtitleChanged.rawValue), object: self, userInfo: nil))
            }
        }
    }
    public let creationDate: Date
    public var image: UIImage? {
        didSet {
            if image != oldValue {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.cardImageChanged.rawValue), object: self, userInfo: nil))
            }
        }
    }
    public var hasImage: Bool {
        return self.image != nil
    }
    public private(set) var shapes: [Shape]
    
    public init(name: String, subTitle: String?, image: UIImage?, creationDate: Date = Date(), shapes: [Shape] = []) {
        self.id = UUID.init().uuidString
        self.name = name
        self.subTitle = subTitle
        self.image = image
        self.creationDate = creationDate
        self.shapes = shapes
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
    
    public func insertRectangleOverImage(backgroundColor: UIColor, borderWidth: CGFloat = 2.0) {
        let newShape = Shape(backgroundColor: backgroundColor, borderColor: UIColor.black, borderWidth: borderWidth)
        shapes.append(newShape)

        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.shapeWasAddedToFlashCard.rawValue), object: self, userInfo: nil))
    }
    
    public func setShapes(to shapes: [Shape]) {
        self.shapes = shapes
    }
    
    func setShapes(to views: [ShapeView]) {
        self.setShapes(to: views.map({ $0.shape }))
    }
    
    public func remove(shape: Shape) {
        self.shapes.remove(object: shape)
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.shapeWasRemovedFromFlashCard.rawValue), object: ShapeRemovalTuple(card: self, shape: shape), userInfo: nil))
    }
}
