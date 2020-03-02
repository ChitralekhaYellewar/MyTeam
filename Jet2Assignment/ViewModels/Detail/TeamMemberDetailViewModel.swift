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
    
    var name: String { get }
    var salary: String { get }
    var age: String { get }
    var profileImage: String { get }
    
}
