//
//  LeagueDetailsPresenter.swift
//  SportsApp
//
//  Created by Amr El Shazly on 03/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol LeaguePresenter{
    var events: [Event] {get}
    var teams: [Team] {get}
    var league: League! {get set}
    func attachView(view: LeagueDetailsView)
    func getEvents ()
    func getTeams()
    func handleFavouritesButton()
    func isFavourite()
}

class LeagueDetailsPresenter: LeaguePresenter {
    
    // MARK: - Properties
    var LeagueDetailsView : LeagueDetailsView!
    var apiServices : APIServices!
    var events : [Event] = []
    var teams : [Team] = []
    var league: League!
    
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
        apiServices.getEventsByLeague(leagueID: league.id, responseDidArrive: eventsResponseDidArrive)
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
        apiServices.getTeamsByLeague(leagueName: league.name, responseDidArrive: teamsResponseDidArrive)
    }
    func teamsResponseDidArrive(teams : [Team]?){
        self.teams = teams!
        print("presenter here number of teams = \(self.teams.count)")
        DispatchQueue.main.async{
            self.LeagueDetailsView.hideIndicator()
            self.LeagueDetailsView.renderingData()
        }
    }
    
    // MARK: - Favourites Methods
    func handleFavouritesButton() {
        //CoreDataServices.shared.clearStorage()
        if CoreDataServices.shared.fetchLeague(id: league.id) == nil {
            CoreDataServices.shared.insertLeagues(league: league)
            LeagueDetailsView.setFavouritesButton(imageName: "star.fill")
            
        }
        else{
            CoreDataServices.shared.deleteLeague(id: league.id)
            LeagueDetailsView.setFavouritesButton(imageName: "star")
        }
        print(CoreDataServices.shared.fetchLeagues().count)
    }
    
    func isFavourite() {
        if CoreDataServices.shared.fetchLeague(id: league.id) == nil {
            LeagueDetailsView.setFavouritesButton(imageName: "star")
        }
        else{
            LeagueDetailsView.setFavouritesButton(imageName: "star.fill")
        }
    }
    
}



