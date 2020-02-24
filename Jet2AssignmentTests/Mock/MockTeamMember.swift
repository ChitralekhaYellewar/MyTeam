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
    static func with(gender: String = "male", name: Name = Name(title: "Mr", first: "brad", last: "gibson"),picture: ProfilePic = ProfilePic(thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"), email: String = "brad.gibson@example.com", dob: BirthDate = BirthDate(date: "1993-07-20T09:44:18.674Z", age: 26), location: Location = Location(street: Street(number: "9278 new road", name: ""), city: "kilcoole", state: "waterford", country: " "), phone: String = "011-962-7516") -> TeamMember
    {
        return TeamMember(gender: gender, name: name, picture: picture, email: email, dob: dob, location: location, phone: phone)
    }
}
