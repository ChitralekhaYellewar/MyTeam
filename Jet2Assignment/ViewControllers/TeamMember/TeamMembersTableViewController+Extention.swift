//
//  TeamMembersTableViewController+Extention.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation
import UIKit

extension TeamMembersTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- Team member tableView Datasource
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teamMemberCells.value.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.teamMemberCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let teamMemberCell = tableView.dequeueReusableCell(withIdentifier: Constants.TABLEVIEWConstants.CELL_IDENTIFIER) as? TeamMemberUITableViewCell else {
                return UITableViewCell()
            }
            teamMemberCell.viewModel = viewModel
            return teamMemberCell
        case .error(let message):
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = Constants.ERRORS.NO_DATA
            return cell
        }
    }
    
    //MARK:- Team member tableView Delegate
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }
    
}

