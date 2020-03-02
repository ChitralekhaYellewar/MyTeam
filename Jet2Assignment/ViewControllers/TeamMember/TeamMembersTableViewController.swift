//
//  TeamMembersTableViewController.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class TeamMembersTableViewController: UIViewController {
    
    @IBOutlet weak var sortMenuPicker: UIPickerView!
    @IBOutlet weak var sortHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    let pickerData = ["sort by name", "sort by age"]
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.SEGUE.SHOW_DETAILS_TEAMMEMBERS , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SHOW_DETAILS_TEAMMEMBERS",
            let destinationViewController = segue.destination as? TeamMemberDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            switch viewModel.teamMemberCells.value[indexPath.row] {
                
            case .normal(let viewModel):
                destinationViewController.detailViewModel = TeamMemberDetailScreenViewModel(teamMember: viewModel.teamMember)
                
            case .empty, .error:
                break
            }
        }
        
    }

    @IBAction func sortTapped() {
        sortMenuPicker.isHidden = sortMenuPicker.isHidden ? false : true
        sortHeight.constant = sortMenuPicker.isHidden ? 0 : 100
    }
}


