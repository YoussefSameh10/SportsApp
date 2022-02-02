//
//  SportsArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class  SportsAPIResponse: Decodable{
    var sports: [Sport]!
    enum CodingKeys: String, CodingKey{
        case sports = "sports"
    }
}
