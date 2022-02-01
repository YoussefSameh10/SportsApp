//
//  TeamsArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class  TeamsArrayModel: Decodable{
    var teamsArray: [TeamModel]!
    enum CodingKeys: String, CodingKey{
        case teamsArray = "teams"
    }
}
