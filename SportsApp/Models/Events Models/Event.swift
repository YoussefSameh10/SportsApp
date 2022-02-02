//
//  EventModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class Event: Decodable{
    
    var id: String!
    var name: String!
    var season: String!
    var homeTeam: String!
    var awayTeam: String!
    var round: String!
    var homeScore: String!
    var awayScore: String!
    var date: String!
    var time: String!
    var stadium: String!
    var country: String!
    var teamVsTeamImage: String!
    var highlightsVideo: String!
    
    enum CodingKeys: String, CodingKey{
        case id = "idEvent"
        case name = "strEvent"
        case season = "strSeason"
        case homeTeam = "strHomeTeam"
        case awayTeam = "strAwayTeam"
        case round = "intRound"
        case homeScore = "intHomeScore"
        case awayScore = "intAwayScore"
        case date = "dateEvent"
        case time = "strTime"
        case stadium = "strVenue"
        case country = "strCountry"
        case teamVsTeamImage = "strThumb"
        case highlightsVideo = "strVideo"
    }
}
