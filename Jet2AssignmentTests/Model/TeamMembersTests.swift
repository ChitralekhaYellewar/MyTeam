//
//  TeamMembersTests.swift
//  Jet2AssignmentTests
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import Jet2Assignment

class TeamMembersTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testSuccessfulInit() {
            let testSuccessfulJSON: JSON = ["name": [
                "first": "John",
                "last": "loan"
                ],
                "gender": "male",
                ]

            //XCTAssertNotNil(TeamMember(json: testSuccessfulJSON))
        }
    }

    // Mark: - extension TeamMember
    private extension TeamMember {
//        init?(json: JSON) {
//            guard let name = json["name"] as? Name,
//                let gender = json["gender"] as? String else {
//                    return nil
//            }
//            self.name = name
//            self.gender = gender
//        }

}
