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
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var viewModel: TeamMemberCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    //MARK:- bind view model data to uitableview cell.
    private func bindViewModel() {
        firstNameLabel.text = viewModel?.name
        salaryLabel.text = viewModel?.salary
        ageLabel.text = viewModel?.age
        guard let profileUrl = viewModel?.profileImage, let url = URL(string: profileUrl) else {
            profileImageView.image = UIImage(named: "profile")
            return
        }
        profileImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "profile"))
    }
}
