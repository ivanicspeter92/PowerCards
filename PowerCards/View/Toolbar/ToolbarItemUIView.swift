//
//  ToolbarItemUIView.swift
//  PowerCards
//
//  Created by Peter Ivanics on 19/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class ToolbarItemUIView: UIView {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    var toolbarItem: ToolbarItem! {
        didSet {
            itemImageView.image = toolbarItem.image
            itemTitleLabel.text = toolbarItem.title
            
            isUserInteractionEnabled = toolbarItem.isEnabled
            if !toolbarItem.isEnabled {
                alpha = 0.3
            }
        }
    }
    var delegate: ToolbarItemDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewWasTapped)))
    }
    
    @objc func viewWasTapped() {
        delegate?.didSelect(toolbarItem: self.toolbarItem)
    }
}

protocol ToolbarItemDelegate {
    func didSelect(toolbarItem item: ToolbarItem)
}
