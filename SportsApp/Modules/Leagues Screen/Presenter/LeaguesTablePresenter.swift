//
//  LeaguesTablePresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol LeaguesPresenter{
    func attachView(viewController: LeaguesView)
    func getLeagues()
    var leagues: [League] {get}
}

class LeaguesTablePresenter: LeaguesPresenter{
    var leaguesView: LeaguesView!
    var apiService: APIServices!
    var leagues: [League] = []
    var sportName: String! = "Soccer"
    
    init(apiService: APIServices){
        self.apiService = apiService
    }
    
    func attachView(viewController: LeaguesView){
        self.leaguesView = viewController
    }
    
    func getLeagues(){
        apiService.getLeaguesBySport(sportName: sportName, responseDidArrive: leaguesResponseDidArrive)
    }
    
    func leaguesResponseDidArrive(responseLeagues: [League]?){
        leagues = responseLeagues!
        leaguesView.reloadTable()
        leaguesView.stopIndicator()
    }
}
