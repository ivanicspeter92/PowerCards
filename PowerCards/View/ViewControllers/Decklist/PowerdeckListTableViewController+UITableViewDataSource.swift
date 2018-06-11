//
//  PowerdeckListTableViewController+UITableViewDataSource.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import Foundation

extension PowerdeckListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return decklist.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = decklist.section(at: section) else { return 0 }
        
        return section.powerdecks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = decklist.section(at: section) else { return nil }
        
        return section.name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deck = decklist.section(at: indexPath.section)!.item(at: indexPath.row)
        let cell = PowerDeckTableViewCell(powerdeck: deck, style: .value1, reuseIdentifier: nil)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if isMyOwnSection(indexPath: indexPath) {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if isMyOwnSection(indexPath: indexPath) {
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
        return nil
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if isMyOwnSection(indexPath: indexPath) {
            return UITableViewCellEditingStyle.delete
        }
        return UITableViewCellEditingStyle.none
    }
    
    // MARK: Private
    private func isMyOwnSection(indexPath: IndexPath) -> Bool {
        if indexPath.section == decklist.sections.index(where: { $0.type == PowerdeckType.own }) {
            return true
        }
        return false
    }
    
    private func handleRenameAction(at indexPath: IndexPath) {
        if let deck = decklist.section(at: indexPath.section)?.item(at: indexPath.row) {
            presentRenameDeckDialog(for: deck)
        }
    }
    
    private func handleDeleteAction(at indexPath: IndexPath) {
        tableView.beginUpdates()
        let section = decklist.section(at: indexPath.section)
        section?.delete(atIndex: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}
