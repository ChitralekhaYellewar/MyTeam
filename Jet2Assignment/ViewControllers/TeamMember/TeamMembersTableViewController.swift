//
//  TeamMembersTableViewController.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class TeamMembersTableViewController: UITableViewController {
        
    let viewModel: TeamMemberTableViewViewModel = TeamMemberTableViewViewModel()
    
    //MARK:- viewDidLoad Team member table view
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.getTeamMembers()
    }
    
    //MARK: - bindViewModel
    func bindViewModel() {
        viewModel.teamMemberCells.bindAndFire() { [weak self] _ in
            self?.tableView?.reloadData()
        }
    }
    
    //MARK: navigation to detail screen.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.SEGUE.SHOW_DETAILS_TEAMMEMBERS , sender: self)
    }
    
}


