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

    var name: String { get }
    var salary: String { get }
    var age: String { get }
    var profileImage: String { get }
}

extension TeamMember: TeamMemberCellViewModel {
    var teamMember: TeamMember {
        return self
    }
    var name: String {
        return employee_name
    }
    var salary: String {
        return employee_salary
    }
    var age: String {
        return employee_age
    }
    var profileImage: String {
        guard let thumbnail = profile_image else {
            return ""
        }
        return thumbnail
    }
}
