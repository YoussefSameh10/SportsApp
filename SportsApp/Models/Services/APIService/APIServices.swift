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
    /*
     https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England&s=Soccer
     */
    func getAllLeagues(responseDidArrive: @escaping ([LeagueModelAPI]?) -> Void){
        let url = "https://www.thesportsdb.com/api/v1/json/2/all_leagues.php"
        let request = AF.request(url)
        request.responseDecodable(of: LeaguesArrayModel.self) { response in
            guard let retrievedLeaguesContainer = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(retrievedLeaguesContainer.leaguesArray)
        }
    }
    
    func getSports(responseDidArrive: @escaping ([SportModel]?) -> Void){
        let url = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
        let request = AF.request(url)
        request.responseDecodable(of: SportsArrayModel.self) { response in
            guard let retrievedSportsContainer = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(retrievedSportsContainer.sportsArray)
        }
    }
    
    func getTeamsOfLeague(leagueName: String, responseDidArrive: @escaping ([TeamModel]?) -> Void){
        let url = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?"
        let request = AF.request(url, parameters: ["l" : leagueName])
        request.responseDecodable(of: TeamsArrayModel.self) { response in
            guard let retrievedTeamsContainer = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(retrievedTeamsContainer.teamsArray)
        }
    }
    
    func getResultsOfTeam(teamID: String, responseDidArrive: @escaping ([EventModel]?) -> Void){
        let url = "https://www.thesportsdb.com/api/v1/json/2/eventslast.php?"
        let request = AF.request(url, parameters: ["id" : teamID])
        request.responseDecodable(of: EventsArrayModel.self) { response in
            guard let retrievedEventsContainer = response.value else{
                responseDidArrive(nil)
                return
            }
            responseDidArrive(retrievedEventsContainer.eventsArray)
        }
    }
    
}
