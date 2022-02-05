//
//  TeamDetailsPresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/4/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol TeamPresenter{
    var team: Team! {get}
    func attachView(teamDetailsView: TeamDetailsView)
}
class TeamDetailsPresenter: TeamPresenter{
    
    var team: Team!
    var teamDetailsView: TeamDetailsView!
    
    func attachView(teamDetailsView: TeamDetailsView){
        self.teamDetailsView = teamDetailsView
    }
    
}
