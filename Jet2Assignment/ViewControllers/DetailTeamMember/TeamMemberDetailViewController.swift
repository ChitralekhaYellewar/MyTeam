//
//  TeamMemberDetailViewController.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class TeamMemberDetailViewController: UIViewController {
    
    var detailViewModel: TeamMemberDetailScreenViewModel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {

        firstNameLabel.text = detailViewModel?.name
        lastNameLabel.text = detailViewModel?.salary
        dobLabel.text = detailViewModel?.age
        
        guard let profileUrl = detailViewModel?.profileImage, let url = URL(string: profileUrl) else {
            profileImageView.image = UIImage(named: "profile")
            return
        }
        profileImageView.sd_setImage(with: url, placeholderImage: UIImage())
    }

}
