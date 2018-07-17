//
//  Shape.swift
//  PowerCards
//
//  Created by Peter Ivanics on 24/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

public class Shape: Equatable, CustomStringConvertible {
    private(set) var backgroundColor: UIColor
    private(set) var borderColor: UIColor
    private(set) var borderWidth: CGFloat
    private(set) var xCenterRelative: CGFloat = 1.0
    private(set) var yCenterRelative: CGFloat = 1.0
    private(set) var widthRelative: CGFloat = 1.0
    private(set) var heightRelative: CGFloat = 1.0
    
    public convenience init(view: UIView) {
//        print("X center coordinate: \(view.center.x), Y center coordinate: \(view.center.y)")
//        print("Superview center coordinate X: \(view.superview?.center.x), Superview center coordinate Y: \(view.superview?.center.y)")
        
        let point = view.superview!.convert(view.center, to: view.superview!)
        
        let xCenterRelative = point.x / view.superview!.bounds.midX
        let yCenterRelative = point.y / view.superview!.bounds.midY
        let widthRelative = view.frame.width / (view.superview?.frame.width ?? view.frame.width)
        let heightRelative = view.frame.height / (view.superview?.frame.height ?? view.frame.height)
        
        self.init(backgroundColor: view.backgroundColor ?? UIColor.clear, borderColor: UIColor(cgColor: view.layer.borderColor ?? UIColor.clear.cgColor), borderWidth: view.layer.borderWidth, xCenterRelative: xCenterRelative, yCenterRelative: yCenterRelative, widthRelative: widthRelative, heightRelative: heightRelative)
    }
    
    public var description: String {
        return "Shape(frame: CGRect.zero, xCenterRelative: CGFloat(\(xCenterRelative)), yCenterRelative: CGFloat(\(yCenterRelative)), widthRelative: CGFloat(\(widthRelative)), heightRelative: CGFloat(\(heightRelative)))"
    }
    
    public init(backgroundColor: UIColor = UIColor.red, borderColor: UIColor = UIColor.black, borderWidth: CGFloat = 3, xCenterRelative: CGFloat = 1.0, yCenterRelative: CGFloat = 1.0, widthRelative: CGFloat = 0.3, heightRelative: CGFloat = 0.05) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.xCenterRelative = xCenterRelative
        self.yCenterRelative = yCenterRelative
        self.widthRelative = widthRelative
        self.heightRelative = heightRelative
        
//        print("X Center: \(xCenterRelative), Y Center: \(yCenterRelative), width relative: \(widthRelative), height relative \(heightRelative)")
    }
}

public func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.backgroundColor == rhs.backgroundColor && lhs.borderWidth == rhs.borderWidth && lhs.borderColor == rhs.borderColor && lhs.xCenterRelative == rhs.xCenterRelative && lhs.yCenterRelative == rhs.yCenterRelative && lhs.widthRelative == rhs.widthRelative
}
