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
    private(set) var xCenterRelative: CGFloat = 1.0
    private(set) var yCenterRelative: CGFloat = 1.0
    private(set) var widthRelative: CGFloat = 1.0
    private(set) var heightRelative: CGFloat = 1.0
    
    public convenience init(layer: CALayer) {
        self.init(frame: layer.frame, backgroundColor: UIColor(cgColor: layer.backgroundColor ?? UIColor.clear.cgColor), borderColor: UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor), borderWidth: layer.borderWidth)
    }
    
    public convenience init(view: UIView) {
        let xCenterRelative = view.center.x / (view.superview?.center.x ?? view.center.x)
        let yCenterRelative = view.center.y / (view.superview?.center.y ?? view.center.y)
        let widthRelative = view.frame.width / (view.superview?.frame.width ?? view.frame.width)
        let heightRelative = view.frame.height / (view.superview?.frame.height ?? view.frame.height)
        
        self.init(frame: view.frame, backgroundColor: view.backgroundColor ?? UIColor.clear, borderColor: UIColor(cgColor: view.layer.borderColor ?? UIColor.clear.cgColor), borderWidth: view.layer.borderWidth, xCenterRelative: xCenterRelative, yCenterRelative: yCenterRelative, widthRelative: widthRelative, heightRelative: heightRelative)
    }
    
    public init(frame: CGRect, backgroundColor: UIColor, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0, xCenterRelative: CGFloat = 1.0, yCenterRelative: CGFloat = 1.0, widthRelative: CGFloat = 0.1, heightRelative: CGFloat = 0.1) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.xCenterRelative = xCenterRelative
        self.yCenterRelative = yCenterRelative
        self.widthRelative = widthRelative
        self.heightRelative = heightRelative
    }
}

public func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.frame == rhs.frame && lhs.backgroundColor == rhs.backgroundColor && lhs.borderWidth == rhs.borderWidth && lhs.borderColor == rhs.borderColor && lhs.xCenterRelative == rhs.xCenterRelative && lhs.yCenterRelative == rhs.yCenterRelative && lhs.widthRelative == rhs.widthRelative && lhs.heightRelative == rhs.heightRelative
}
