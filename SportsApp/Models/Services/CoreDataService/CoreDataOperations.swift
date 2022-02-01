//
//  CoreDataOperations.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol CoreDataOperations{
    func insertLeagues(league: LeagueModelAPI)
    func fetchLeagues() -> [LeagueModel]
    func fetchLeague(id: String) -> LeagueModel!
    func deleteLeague(id: String)
}

