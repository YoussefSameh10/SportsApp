//
//  TeamModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class Team: Decodable{
    var id: String!
    var name: String!
    var shortName: String!
    var establishmentYear: String!
    var stadium: String!
    var nickname: String!
    var stadiumImage: String!
    var teamBadge: String!
    var teamJersey: String!
    var website: String!
    var facebookLink: String!
    var twitterLink: String!
    var instagramLink: String!
    
    
    enum CodingKeys: String, CodingKey{
        case id = "idTeam"
        case name = "strTeam"
        case shortName = "strTeamShort"
        case establishmentYear = "intFormedYear"
        case stadium = "strStadium"
        case nickname = "strKeywords"
        case stadiumImage = "strStadiumThumb"
        case teamBadge = "strTeamBadge"
        case teamJersey = "strTeamJersey"
        case website = "strWebsite"
        case facebookLink = "strFacebook"
        case twitterLink = "strTwitter"
        case instagramLink = "strInstagram"
    }
}




