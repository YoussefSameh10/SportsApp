//
//  SportsArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class  SportsArrayModel: Decodable{
    var sportsArray: [SportModel]!
    enum CodingKeys: String, CodingKey{
        case sportsArray = "sports"
    }
}
