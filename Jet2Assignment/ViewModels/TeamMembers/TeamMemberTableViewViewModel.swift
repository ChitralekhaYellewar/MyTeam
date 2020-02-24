//
//  TeamMemberTableViewViewModel.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation

class TeamMemberTableViewViewModel {
    
    //MARK:- TeamMember TableView Cell Type
    enum TeamMemberTableViewCellType {
        case normal(cellViewModel: TeamMemberCellViewModel)
        case error(message: String)
        case empty
    }
    
    let teamMemberCells = Bindable([TeamMemberTableViewCellType]())
    let appServerClient: AppServerClient
    
    //MARK:- Dependecy Injection
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    //MARK:- get Team Members from AppServerClient.
    func getTeamMembers() {
        appServerClient.getTeamMembers(Constants.URLConstants.TEAM_MEMBERS_URL, completion: { [weak self] result in
            switch result {
            case .success(let teamMembers):
                guard teamMembers.results.count > 0 else {
                    self?.teamMemberCells.value = [.empty]
                    return
                }
                self?.teamMemberCells.value = teamMembers.results.compactMap { TeamMemberTableViewCellType.normal(cellViewModel: $0 as TeamMemberCellViewModel)}

            case .failure(let error):
                self?.teamMemberCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed..")]
            }
        })
    }
    
    //MARK:- get Team Members from AppServerClient sorted by name.
    func getTeamMembersSortbyName() {
        appServerClient.getTeamMembers(Constants.URLConstants.TEAM_MEMBERS_URL, completion: { [weak self] result in
            switch result {
            case .success(let teamMembers):
                guard teamMembers.results.count > 0 else {
                    self?.teamMemberCells.value = [.empty]
                    return
                }
                let resultsArray = teamMembers.results.sorted(by: { $0.name.last < $1.name.last })
                self?.teamMemberCells.value = resultsArray.compactMap { TeamMemberTableViewCellType.normal(cellViewModel: $0 as TeamMemberCellViewModel)}

            case .failure(let error):
                self?.teamMemberCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")]
            }
        })
    }
    
    //MARK:- get Team Members from AppServerClient sorted by age.
    func getTeamMembersSortbyAge() {
        appServerClient.getTeamMembers(Constants.URLConstants.TEAM_MEMBERS_URL, completion: { [weak self] result in
            switch result {
            case .success(let teamMembers):
                guard teamMembers.results.count > 0 else {
                    self?.teamMemberCells.value = [.empty]
                    return
                }
                let resultsArray = teamMembers.results.sorted(by: { $0.dob.age < $1.dob.age })
                self?.teamMemberCells.value = resultsArray.compactMap { TeamMemberTableViewCellType.normal(cellViewModel: $0 as TeamMemberCellViewModel)}

            case .failure(let error):
                self?.teamMemberCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")]
            }
        })
    }
}

//MARK:- get TeamMembers failure reason messages.
fileprivate extension AppServerClient.GetTeamMembersFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return Constants.ERRORS.UNAUTHORISED
        case .notFound:
            return Constants.ERRORS.NOT_FOUND
        case .badGateway:
            return Constants.ERRORS.BAD_GATEWAY
        }
    }
}


