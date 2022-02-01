//
//  AmrViewController.swift
//  SportsApp
//
//  Created by Youssef on 1/29/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class AmrViewController: UIViewController {

    var leagues: [LeagueModelAPI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiServices = APIServices()
        apiServices.getAllLeagues(responseDidArrive: { (leaguesArray) in
            print("View: \(leaguesArray!.count)")
            self.leagues.append(contentsOf: leaguesArray![0...9])
            
            
        })
        
//        apiServices.getSports { (sportsArray) in
//            print(sportsArray!.count)
//            print(sportsArray![0].name)
//        }
        
//        apiServices.getTeamsOfLeague(leagueName: "English Premier League") { (teamsArray) in
//            print(teamsArray!.count)
//            print(teamsArray![0].name)
//        }
//        apiServices.getResultsOfTeam(teamID: "133602") { (eventsArray) in
//            print(eventsArray!.count)
//            print(eventsArray![0].name)
//        }
    }
    
    @IBAction func addToFavourites(_ sender: Any) {
        let c = CoreDataServices.shared
        for l in self.leagues{
            //c.insertLeagues(league: l)
        }
        c.deleteLeague(id: leagues[7].id!)
        let leagues = c.fetchLeagues()
        print(leagues.count)
    }
    
}
