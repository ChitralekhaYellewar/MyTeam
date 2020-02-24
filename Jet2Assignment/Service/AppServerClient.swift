//
//  AppServerClient.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 24/02/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import Foundation
import Alamofire

class AppServerClient {
    
    //MARK:- Server call failure enum.
    enum GetTeamMembersFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case badGateway = 502
    }
    
    //MARK:- Server call Result enum.
    enum Result<T, U: Error> {
        case success(payload: T)
        case failure(U?)
    }
    
    typealias GetTeamMembersResult = Result<TeamMemberResponse, GetTeamMembersFailureReason>
    typealias GetTeamMembersCompletion = (_ result: GetTeamMembersResult) -> Void
    
    //MARK:- get Team members data from API.
    func getTeamMembers(_ url: String, completion: @escaping GetTeamMembersCompletion) {
        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(nil))
                            return
                        }
                        
                        let teamMembers = try JSONDecoder().decode(TeamMemberResponse.self, from: data)
                        completion(.success(payload: teamMembers))
                    } catch {
                        completion(.failure(nil))
                    }
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetTeamMembersFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
}


