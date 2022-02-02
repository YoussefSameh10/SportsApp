//
//  SportModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation



class Sport: Decodable{
    var id: String!
    var name: String!
    var logo: String!
    
    enum CodingKeys: String, CodingKey{
        case id = "idSport"
        case name = "strSport"
        case logo = "strSportThumb"
    }
}
