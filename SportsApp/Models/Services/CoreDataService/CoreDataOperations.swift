//
//  CoreDataOperations.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

protocol CoreDataOperations{
    func insertLeagues()
    func fetchLeagues() -> [LeagueModel]
    func deleteLeague(league: LeagueModel)
}

