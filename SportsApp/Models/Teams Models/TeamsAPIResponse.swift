//
//  TeamsArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class  TeamsAPIResponse: Decodable{
    var teams: [Team]!
    enum CodingKeys: String, CodingKey{
        case teams = "teams"
    }
}
