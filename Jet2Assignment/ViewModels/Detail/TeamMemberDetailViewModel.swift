//
//  TeamMemberDetailViewModel.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation

protocol TeamMemberDetailViewModel {
    var teamMember: TeamMember { get }
    var firstname: String { get }
    var lastname: String { get }
    var gender: String { get }
    var dateOfBirth: String { get }
    var profileImage: String { get }
    var emailId: String { get }
    var phoneNum: String { get }
    var address: String { get }
}
