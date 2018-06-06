//
//  DeckDetailsTableViewController+UITableViewDelegate.swift
//  PowerCards
//
//  Created by Peter Ivanics on 06/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

extension DeckDetailsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let card = self.powerdeck?.card(at: indexPath.row) else { return }
        
        self.toCard(card: card)
    }
}
