//
//  Shape.swift
//  PowerCards
//
//  Created by Peter Ivanics on 24/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

public class Shape: Equatable {
    private(set) var frame: CGRect
    private(set) var backgroundColor: UIColor
    private(set) var borderColor: UIColor
    private(set) var borderWidth: CGFloat
    
    public convenience init(layer: CALayer) {
        self.init(frame: layer.frame, backgroundColor: UIColor(cgColor: layer.backgroundColor ?? UIColor.clear.cgColor), borderColor: UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor), borderWidth: layer.borderWidth)
    }
    
    public convenience init(view: UIView) {
        self.init(frame: view.frame, backgroundColor: view.backgroundColor ?? UIColor.clear, borderColor: UIColor(cgColor: view.layer.borderColor ?? UIColor.clear.cgColor), borderWidth: view.layer.borderWidth)
    }
    
    public init(frame: CGRect, backgroundColor: UIColor, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

public func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.frame == rhs.frame && lhs.backgroundColor == rhs.backgroundColor && lhs.borderWidth == rhs.borderWidth && lhs.borderColor == rhs.borderColor
}
