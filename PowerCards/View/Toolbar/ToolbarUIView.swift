//
//  ToolbarUIView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 12/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class ToolbarUIView: XIBLoadingUIView {
    @IBOutlet weak var itemsContainer: UIStackView!
    var delegate: ToolbarItemDelegate? {
        didSet {
            itemsContainer.arrangedSubviews.compactMap({ $0 as? ToolbarItemUIView}).forEach({ $0.delegate = self.delegate })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let theme = ThemeManager.current
        layer.masksToBounds = false
        layer.borderColor = theme.toolbarBorderColor
        layer.borderWidth = theme.toolbarBorderWidth
        layer.cornerRadius = theme.toolbarCornerRadius
        layer.shadowOffset = theme.toolbarShadowOffset
        layer.shadowColor = theme.toolbarShadowColor
        layer.shadowOpacity = theme.toolbarShadowOpacity
        layer.shadowRadius = theme.toolbarShadowRadius
        
        ToolbarItem.all.forEach({
            let view = ToolbarItemUIView.loadFromNib()
            
            view.toolbarItem = $0
            itemsContainer.addArrangedSubview(view)
        })
    }
}
