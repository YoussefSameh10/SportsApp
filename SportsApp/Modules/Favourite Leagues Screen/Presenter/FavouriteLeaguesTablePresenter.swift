//
//  FavouriteLeaguesPresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/3/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol FavouriteLeaguesPresenter{
    func attachView(viewController: FavouriteLeaguesView)
    func getLeagues()
    var leagues: [LeagueModel] {get}
}

class FavouriteLeaguesTablePresenter: FavouriteLeaguesPresenter{
    var favouriteLeaguesView: FavouriteLeaguesView!
    var coreDataService = CoreDataServices.shared
    var leagues: [LeagueModel] = []
    

    func attachView(viewController: FavouriteLeaguesView){
        self.favouriteLeaguesView = viewController
        favouriteLeaguesView.reloadTable()
        favouriteLeaguesView.stopIndicator()
    }
    
    func getLeagues(){
        leagues = coreDataService.fetchLeagues()
    }
}
