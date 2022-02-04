//
//  LeagueDetailsPresenter.swift
//  SportsApp
//
//  Created by Amr El Shazly on 03/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter {
    
    // MARK: - Properties
    var LeagueDetailsView : LeagueDetailsView!
    var apiServices : APIServices!
    var events : [Event] = []
    var leagueID : String! = "4905"
    var teams : [Team] = []
    var leagueName : String! = "Albanian Superliga"
    
    // MARK: - Init
    init(apiServices : APIServices){
        self.apiServices = apiServices
    }
    // MARK: - Methods
    func attachView(view: LeagueDetailsView ){
        self.LeagueDetailsView = view
    }
    
    
    // MARK: - Events Methods
    func getEvents (){
        apiServices.getEventsByLeague(leagueID: leagueID, responseDidArrive: eventsResponseDidArrive)
    }
    func eventsResponseDidArrive(events: [Event]?){
        //self.events = (Events?.filter({ $0.awayScore == nil }))!
        self.events = events!
        DispatchQueue.main.async {
            self.LeagueDetailsView.hideIndicator()
            self.LeagueDetailsView.renderingData()
            
        }
        print("here presenter Events")
        print(self.events.count)
        print(self.events[0].name!)
    }
    // MARK: - Teams Methods
    func getTeams(){
        apiServices.getTeamsByLeague(leagueName: leagueName, responseDidArrive: teamsResponseDidArrive)
    }
    func teamsResponseDidArrive(teams : [Team]?){
        self.teams = teams!
        print("presenter here number of teams = \(self.teams.count)")
        DispatchQueue.main.async{
            self.LeagueDetailsView.hideIndicator()
            self.LeagueDetailsView.renderingData()
        }
    }
    
}



