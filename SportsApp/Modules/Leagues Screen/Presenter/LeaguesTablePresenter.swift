//
//  LeaguesTablePresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class LeaguesTablePresenter{
    var viewController: LeaguesTableViewController!
    var apiService: APIServices!
    var leagues: [League] = []
    var sportName: String! = "Soccer"
    
    init(apiService: APIServices){
        self.apiService = apiService
    }
    
    func attachView(viewController: LeaguesTableViewController){
        self.viewController = viewController
    }
    
    func getLeagues(){
        apiService.getLeaguesBySport(sportName: sportName, responseDidArrive: leaguesResponseDidArrive)
    }
    
    func leaguesResponseDidArrive(responseLeagues: [League]?){
        print(responseLeagues![0].badge)
        leagues = responseLeagues!
        viewController.leaguesTable.reloadData()
    }
}
