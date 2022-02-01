//
//  LeagueModelAPI.swift
//  SportsApp
//
//  Created by Youssef on 2/1/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class LeagueModelAPI: Decodable{
    var id: String!
    var name: String!
    var alternateName: String!
    var sport: String!
    
    enum CodingKeys: String, CodingKey{
        case id = "idLeague"
        case name = "strLeague"
        case alternateName = "strLeagueAlternate"
        case sport = "strSport"
    }
}
