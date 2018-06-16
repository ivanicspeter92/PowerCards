//
//  PowerFlashCard.swift
//  PowerCardsBusinessRules
//
//  Created by Peter Ivanics on 02/06/2018.
//  Copyright © 2018 Lovented Oy. All rights reserved.
//

import Foundation
import UIKit

public class Shape {
    private(set) var frame: CGRect
    private(set) var backgroundColor: UIColor
    private(set) var borderColor: UIColor
    private(set) var borderWidth: CGFloat
    
    public convenience init(layer: CALayer) {
        self.init(frame: layer.frame, backgroundColor: UIColor(cgColor: layer.backgroundColor ?? UIColor.clear.cgColor), borderColor: UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor), borderWidth: layer.borderWidth)
    }
    
    public init(frame: CGRect, backgroundColor: UIColor, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
    var view: UIView {
        let view = UIView(frame: self.frame)
        
        view.backgroundColor = self.backgroundColor
        view.layer.borderWidth = self.borderWidth
        view.layer.borderColor = self.borderColor.cgColor
        
        return view
    }
}

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
    public private(set) var shapes: [Shape] = []
    
    public init(name: String, subTitle: String?, image: UIImage?, creationDate: Date = Date()) {
        self.id = UUID.init().uuidString
        self.name = name
        self.subTitle = subTitle
        self.image = image
        self.creationDate = creationDate
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
    
    public func insertRectangleOverImage(backgroundColor: UIColor, x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 200, height: CGFloat = 50) {
        let rect = CGRect(x: x, y: y, width: width, height: height)
        let newShape = Shape(frame: rect, backgroundColor: backgroundColor, borderColor: UIColor.black, borderWidth: 2)
        shapes.append(newShape)

        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: NotificationKeys.shapeWasAddedToFlashCard.rawValue), object: self, userInfo: nil))
    }
    
    public func setShapes(to shapes: [Shape]) {
        self.shapes = shapes
    }
    
    public func setShapes(to layers: [CALayer]) {
        self.setShapes(to: layers.flatMap({ Shape(layer: $0 )}))
    }
}
