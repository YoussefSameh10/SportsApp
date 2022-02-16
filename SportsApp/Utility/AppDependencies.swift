//
//  AppDependencies.swift
//  SportsApp
//
//  Created by Youssef on 2/16/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies{
    
    static var apiServices: APIServices{
        return APIServices()
    }
    
    static var initialTabBarController: UITabBarController{
        let nc = UIStoryboard(name: "Amr", bundle: nil).instantiateInitialViewController() as! UITabBarController
        return nc;
    }
    
    static var sportsPresenter: SportsPresenterProtocol{
        return SportsPreseneter(apiServices: apiServices)
    }
    
    static var sportsView: SportsView{
        let sv = initialTabBarController.viewControllers?.first as! SportsView
        return sv
    }
    
    static var leaguesPresenter: LeaguesPresenter{
        return LeaguesTablePresenter(apiService: apiServices)
    }
    
    static var favouriteLeaguesPresenter: LeaguesPresenter{
        return FavouriteLeaguesTablePresenter()
    }
    
    static var leagueDetailsPresenter: LeaguePresenter{
        return LeagueDetailsPresenter(apiServices: apiServices)
    }
    
    static var teamDetailsPresenter: TeamPresenter{
        return TeamDetailsPresenter()
    }
    
}
