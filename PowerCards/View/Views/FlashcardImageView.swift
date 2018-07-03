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
        guard let card = self.card, let notificationTuple = notification.object as? ShapeRemovalTuple, notificationTuple.card  === card else { return }
        
        subviews.compactMap({ $0 as? ShapeView }).first(where: { $0.shape == notificationTuple.shape })?.removeFromSuperview()
    }
    
    // MARK: Private
    private func loadCardToView() {
        subviews.forEach({ $0.removeFromSuperview() })
        
        image = card?.image ?? Defaults.cameraIcon
        card?.shapes.forEach({ self.addSubview( ShapeView.instantiate(for: $0, disabled: !enableMovingShapes) )})
    }
}

protocol FlashcardImageViewDelegate {
    func selected(shape: Shape)
}
