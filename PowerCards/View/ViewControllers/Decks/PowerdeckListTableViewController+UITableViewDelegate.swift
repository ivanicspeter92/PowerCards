//
//  PowerdeckListTableViewController+UITableViewDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

extension PowerdeckListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deck = self.decklist.section(at: indexPath.section)!.item(at: indexPath.row)
        
        delegate?.selected(powerdeck: deck)
    }
}
