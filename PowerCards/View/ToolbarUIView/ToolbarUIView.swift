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
    
    private(set) var activeToolbarItem: ToolbarItem? {
        didSet {
            if let oldValue = oldValue, oldValue.isSticky && activeToolbarItem?.isSticky != false {
                delegate?.didDeselect(item: oldValue)
            }
            if let activeToolbarItem = activeToolbarItem {
                delegate?.didSelect(item: activeToolbarItem)
                
                if !activeToolbarItem.isSticky {
                    self.activeToolbarItem = oldValue
                }
            }
            highlightActiveToolbar(for: activeToolbarItem)
        }
    }
    
    var delegate: ToolbarDelegate?
    private var toolbarItemViews: [ToolbarItemUIView] {
        return itemsContainer.arrangedSubviews.compactMap({ $0 as? ToolbarItemUIView })
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
            view.delegate = self
            itemsContainer.addArrangedSubview(view)
        })
    }
    
    private func highlightActiveToolbar(for item: ToolbarItem?) {
        if let item = item, let view = toolbarItemViews.first(where: { $0.toolbarItem == item }) {
            highlightActiveToolbar(for: nil)
            view.highlighted = true
        } else {
            toolbarItemViews.filter({ $0.highlighted == true }).forEach({ $0.highlighted = false })
        }
    }
}

extension ToolbarUIView: ToolbarItemDelegate {
    func didSelect(toolbarItem item: ToolbarItem) {
        if self.activeToolbarItem == item {
            activeToolbarItem = nil
        } else {
            activeToolbarItem = item
        }
    }
}

protocol ToolbarDelegate {
    func didSelect(item: ToolbarItem)
    func didDeselect(item: ToolbarItem)
}
