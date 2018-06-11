//
//  DeckDetailsTableViewController+UITableViewDataSource.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

extension DeckDetailsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return powerdeck?.cards.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PowerFlashCardTableViewCell(powercard: powerdeck!.cards[indexPath.row] as! PowerFlashCard, style: .subtitle, reuseIdentifier: nil)
        
        return cell
    }
    
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return true
        }
        return false
     }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let renameAction = UITableViewRowAction(style: .normal, title: "Rename", handler: { [weak self] action, indexPath in
            self?.handleRenameAction(at: indexPath)
        })
        renameAction.backgroundColor = .gray
        
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete", handler: { [weak self] action, indexPath in
            self?.handleDeleteAction(at: indexPath)
        })
        deleteAction.backgroundColor = .red
        
        return [deleteAction, renameAction]
    }
    
    // MARK: Private
    private func handleRenameAction(at indexPath: IndexPath) {
        if let card = powerdeck?.card(at: indexPath.row) {
            presentRenameDeckDialog(for: card)
        }
    }
    
    private func handleDeleteAction(at indexPath: IndexPath) {
        tableView.beginUpdates()
        powerdeck?.removeCard(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}
