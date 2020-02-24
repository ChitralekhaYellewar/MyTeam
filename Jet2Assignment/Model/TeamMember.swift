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
    let results: [TeamMember]
}

//MARK:- TeamMember Model
struct TeamMember: Codable {
    let gender: String
    let name: Name
    let picture: [String: String]
    let email: String
    let dob: BirthDate
    let location: Location
    let phone: String
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
    let street: Street
    let city: String
    let state: String
    let country: String
    //let postcode: Int16
}

struct Street: Codable {
    let number: Int
    let name: String
}
