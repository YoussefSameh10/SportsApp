//
//  APIServices.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import Alamofire

class APIServices{
    init(){
        
    }
    
    //Sports Screen
    func getSports(responseDidArrive: @escaping ([Sport]?) -> Void){
        let url = baseUrl + sportsRequest
        let request = AF.request(url)
        request.responseDecodable(of: SportsAPIResponse.self) { response in
            guard let apiResponse = response.value else{
                responseDidArrive(nil)
                return
            }
            
            responseDidArrive(apiResponse.sports)
        }
    }

    //Leagues Screen
    func getLeaguesBySport(sportName: String, responseDidArrive: @escaping ([League]?) -> Void){
        let url = baseUrl + leaguesRequest
        let request = AF.request(url, parameters: ["s" : sportName])
        request.responseDecodable(of: LeaguesAPIResponse.self) { response in
            guard let apiResponse = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(apiResponse.leagues)
        }
    }

    //LeagueDetails Screen
    func getTeamsByLeague(leagueName: String, responseDidArrive: @escaping ([Team]?) -> Void){
        let url = baseUrl + teamsRequest
        let request = AF.request(url, parameters: ["l" : leagueName])
        request.responseDecodable(of: TeamsAPIResponse.self) { response in
            guard let apiResponse = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(apiResponse.teams)
        }
    }
    
    //LeagueDetails Screen
    func getEventsByLeague(leagueID: String, responseDidArrive: @escaping ([Event]?) -> Void){
        let url = baseUrl + eventsRequest
        let request = AF.request(url, parameters: ["id" : leagueID])
        request.responseDecodable(of: EventsAPIResponse.self) { response in
            guard let apiResponse = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(apiResponse.events)
        }
    }
    
}
