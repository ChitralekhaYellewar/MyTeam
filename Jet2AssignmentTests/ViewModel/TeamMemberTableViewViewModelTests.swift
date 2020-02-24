//
//  TeamMemberTableViewViewModelTests.swift
//  Jet2AssignmentTests
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import Jet2Assignment

class TeamMemberTableViewViewModelTests: XCTestCase {
    
    // MARK: - getTeamMember
    func testNormalTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getTeamMemberResult = .success(payload: TeamMemberResponse(results: [TeamMember.with()]))//.success(payload: [TeamMember.with()])

        let viewModel = TeamMemberTableViewViewModel(appServerClient: appServerClient)
        viewModel.getTeamMembers()

        guard case .some(.normal(_)) = viewModel.teamMemberCells.value.first else {
            XCTFail()
            return
        }
    }

    func testEmptyTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getTeamMemberResult = .success(payload: TeamMemberResponse(results: []))

        let viewModel = TeamMemberTableViewViewModel(appServerClient: appServerClient)
        viewModel.getTeamMembers()

        guard case .some(.empty) = viewModel.teamMemberCells.value.first else {
            XCTFail()
            return
        }
    }

    func testErrorTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getTeamMemberResult = .failure(AppServerClient.GetTeamMembersFailureReason.notFound)

        let viewModel = TeamMemberTableViewViewModel(appServerClient: appServerClient)
        viewModel.getTeamMembers()

        guard case .some(.error(_)) = viewModel.teamMemberCells.value.first else {
            XCTFail()
            return
        }
    }

}

private final class MockAppServerClient: AppServerClient {
    var getTeamMemberResult: AppServerClient.GetTeamMembersResult?

    override func getTeamMembers(_ url: String, completion: @escaping AppServerClient.GetTeamMembersCompletion) {
        completion(getTeamMemberResult!)
    }

}
