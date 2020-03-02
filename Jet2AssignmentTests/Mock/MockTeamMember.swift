//
//  MockTeamMember.swift
//  Jet2AssignmentTests
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation
@testable import Jet2Assignment

extension TeamMember {
    
    static func with(name: String = "Tiger Nixon", salary: String = "320800", age: String = "61", image: String = "") -> TeamMember {
        return TeamMember(employee_name: name, employee_salary: salary, employee_age: age, profile_image: image)
    }
}
