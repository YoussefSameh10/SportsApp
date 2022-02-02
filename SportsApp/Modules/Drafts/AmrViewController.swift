//
//  AmrViewController.swift
//  SportsApp
//
//  Created by Youssef on 1/29/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class AmrViewController: UIViewController {

    // MARK: - Outlets
    
    
    
    // MARK: - Properties
    var leagues: [League] = []
    var sports : [Sport]!

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.testAPI()
    }
    
    
    //MARK:- Methods
    
    func testAPI(){
        let apiServices = APIServices()
        apiServices.getSports(responseDidArrive: sportsResponseDidArrive)
        apiServices.getLeaguesBySport(sportName: "Soccer", responseDidArrive: leaguesResponseDidArrive)
        apiServices.getTeamsByLeague(leagueName: "Albanian Superliga", responseDidArrive: teamsResponseDidArrive)
        apiServices.getEventsByLeague(leagueID: "4905", responseDidArrive: eventsResponseDidArrive)
    }
    
    func testCoreData(){
        let c = CoreDataServices.shared
        c.clearStorage()
        for l in self.leagues{
            //c.insertLeagues(league: l)
        }
        //c.deleteLeague(id: leagues[0].id!)
        let leagues = c.fetchLeagues()
        print(leagues.count)
    }
    
    func sportsResponseDidArrive(sports: [Sport]?){
        print("1.------------")
        print("Sports retrieved successfully")
        print(sports!.count)
        print(sports![0].name!)
        print("2.------------")
        self.sports = sports
        print(self.sports.count)
        print(self.sports[0].name!)
    }
    
    func leaguesResponseDidArrive(leagues: [League]?){
        print("Leagues")
        print(leagues!.count)
        print(leagues![0].name!)
        self.leagues.append(contentsOf: leagues![0...4])
    }
    
    func teamsResponseDidArrive(teams: [Team]?){
        print("Teams")
        print(teams!.count)
        print(teams![0].name!)
    }
    
    func eventsResponseDidArrive(events: [Event]?){
        print("Events")
        print(events!.count)
        print(events![0].name!)
    }
    
    
    //MARK:- Actions
    @IBAction func addToFavourites(_ sender: Any) {
        //self.testCoreData()
    }
    
}
