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
        firstNameLabel.text = detailViewModel?.firstname
        lastNameLabel.text = detailViewModel?.lastname
        dobLabel.text = detailViewModel?.dateOfBirth
        locationLabel.text = detailViewModel?.address
        emailLabel.text = detailViewModel?.emailId
        phoneNumberLabel.text = detailViewModel?.phoneNum
        
        guard let profileUrl = detailViewModel?.profileImage, let url = URL(string: profileUrl) else {
            return
        }
        profileImageView.sd_setImage(with: url, placeholderImage: UIImage())
    }

}
