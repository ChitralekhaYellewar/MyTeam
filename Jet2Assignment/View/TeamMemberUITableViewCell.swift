//
//  TeamMemberUITableViewCell.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import UIKit
import SDWebImage

class TeamMemberUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var viewModel: TeamMemberCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    //MARK:- bind view model data to uitableview cell.
    private func bindViewModel() {
        firstNameLabel.text = viewModel?.firstnameN
        lastNameLabel.text = viewModel?.lastnameN
        genderLabel.text = viewModel?.genderN
        guard let profileUrl = viewModel?.profileImageN, let url = URL(string: profileUrl) else {
            return
        }
        profileImageView.sd_setImage(with: url, placeholderImage: UIImage())
    }
}
