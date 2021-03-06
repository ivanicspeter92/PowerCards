//
//  FlashcardImageView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 18/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit
import SPUserResizableView_Pion

class FlashcardImageView: UIImageView {
    var card: PowerFlashCard? {
        didSet {
            loadCardToView()
        }
    }
    var delegate: FlashcardImageViewDelegate?
    var enableMovingShapes: Bool = false
    
    // MARK:
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(shapeWasRemovedNotificationReceived(_:)), name: NSNotification.Name(rawValue: NotificationKeys.shapeWasRemovedFromFlashCard.rawValue), object: nil)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Event handlers
    func wasTapped(at location: CGPoint) {
        let shapeViews = subviews.compactMap({ $0 as? ShapeView})
        
        if let shapeView = shapeViews.first(where: { $0.frame.contains(location) }) {
            self.delegate?.selected(shape: shapeView.shape)
        }
    }
    
    // MARK: Notification listeners
    @objc func shapeWasRemovedNotificationReceived(_ notification: Notification) {
        guard let card = self.card, let notificationTuple = notification.object as? ShapeRemovalTuple, notificationTuple.card  === card, let shapeView = subviews.compactMap({ $0 as? ShapeView }).first(where: { $0.shape == notificationTuple.shape }) else { return }
        
        shapeView.disable = true
        shapeView.removeFromSuperview()
    }
    
    // MARK: Private
    private func loadCardToView() {
        subviews.forEach({ $0.removeFromSuperview() })
            
        image = card?.image ?? Defaults.cameraIcon
        card?.shapes.forEach({
            let view = ShapeView.instantiate(for: $0, delegate: self, disabled: !enableMovingShapes)
            self.addSubview(view)
            
            addLayoutConstraints(for: view)
        })
    }
    
    func addLayoutConstraints(for shapeView: ShapeView) {
        self.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: shapeView.shape.xCenterRelative, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: shapeView.shape.yCenterRelative, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: shapeView.shape.widthRelative, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: shapeView.shape.heightRelative, constant: 0.0))
    }
    
    private func removeLayoutConstraints(for shapeView: ShapeView) {
        let constraints = self.constraints.filter({ (($0.firstItem as? ShapeView) === shapeView && $0.secondItem === self) || (($0.secondItem as? ShapeView) === shapeView && $0.firstItem === self) })
        
        self.removeConstraints(constraints)
    }
}

protocol FlashcardImageViewDelegate {
    func selected(shape: Shape)
}

extension FlashcardImageView: ShapeViewDelegate {
    func touchesStarted(for shapeview: ShapeView) {
        self.removeLayoutConstraints(for: shapeview)
    }
    
    func touchesEnded(for shapeview: ShapeView) {
        addLayoutConstraints(for: shapeview)
    }
}
