//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by Youssef on 2/11/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol LeaguesPresenter{
    func attachView(viewController: LeaguesView)
    func getLeagues()
    func getLeaguesIfConnected()
    var leagues: [League] {get}
    var sportName: String! {get set}
}
