//
//  LeaguesTablePresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class LeaguesTablePresenter: LeaguesPresenter{
    var leaguesView:LeaguesView!
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
        leagues = responseLeagues ?? []
        leagues.swapAt(0, leagues.count - 1)
        leagues.swapAt(1, leagues.count - 1)
        leaguesView.reloadTable()
        leaguesView.stopIndicator()
    }
    
    func getLeaguesIfConnected() {
        apiService.checkForNetworkConnectivity(getMethod: getLeagues, stopIndicatorMethod: leaguesView.stopIndicator, showAlert: leaguesView.showNetworkAlert)
    }
}
