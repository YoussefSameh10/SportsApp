//
//  FavouriteLeaguesPresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/3/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class FavouriteLeaguesTablePresenter: LeaguesPresenter{
    
    
    var sportName: String!
    var favouriteLeaguesView: LeaguesView!
    var coreDataService = CoreDataServices.shared
    var leagues: [League] = []
    

    func attachView(viewController: LeaguesView){
        self.favouriteLeaguesView = viewController
        favouriteLeaguesView.reloadTable()
        favouriteLeaguesView.stopIndicator()
    }
    
    func getLeagues(){
        leagues = coreDataService.fetchLeagues()
        favouriteLeaguesView.reloadTable()
    }
    
    func getLeaguesIfConnected() {
        
    }
    
    
}
