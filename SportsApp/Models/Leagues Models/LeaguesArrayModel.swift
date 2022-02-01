//
//  LeaguesArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class  LeaguesArrayModel: Decodable{
    var leaguesArray: [LeagueModelAPI] = []
    enum CodingKeys: String, CodingKey{
        case leaguesArray = "leagues"
    }
}
