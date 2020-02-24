//
//  TeamMemberCellViewModel.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation

//MARK:- TeamMemberCellViewModel protocol
protocol TeamMemberCellViewModel {
    var teamMember: TeamMember { get }
    var firstnameN: String { get }
    var lastnameN: String { get }
    var genderN: String { get }
    var profileImageN: String { get }
}

extension TeamMember: TeamMemberCellViewModel {
    var teamMember: TeamMember {
        return self
    }
    var firstnameN: String {
        return name.first
    }
    var lastnameN: String {
        return name.last
    }
    var genderN: String {
        return gender
    }
    var profileImageN: String {
        guard let thumbnail = picture.thumbnail else {
            return ""
        }
        return thumbnail
    }
}
