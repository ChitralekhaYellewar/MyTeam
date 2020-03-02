//
//  TeamMember.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation

//MARK:- TeamMember Response Model 
struct TeamMemberResponse: Codable {
    let data: [TeamMember]
}

//MARK:- TeamMember Model
/*struct TeamMember: Codable {
    var gender: String
    var name: Name
    let picture: ProfilePic
    let email: String
    let dob: BirthDate
    let location: Location
    let phone: String
}

struct ProfilePic: Codable {
    let thumbnail : String?
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct BirthDate: Codable {
    let date: String
    let age: Int
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct Street: Codable {
    let number: String?
    let name: String?
} */

struct TeamMember: Codable {
    let employee_name: String
    let employee_salary: String
    let employee_age: String
    let profile_image: String?
}
