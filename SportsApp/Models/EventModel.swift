//
//  EventModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class EventModel{
    
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

/*
 {
     "idEvent": "1154141",
     "idSoccerXML": null,
     "idAPIfootball": "710769",
     "strEvent": "Liverpool vs Brentford",
     "strEventAlternate": "Brentford @ Liverpool",
     "strFilename": "English Premier League 2022-01-16 Liverpool vs Brentford",
     "strSport": "Soccer",
     "idLeague": "4328",
     "strLeague": "English Premier League",
     "strSeason": "2021-2022",
     "strDescriptionEN": "",
     "strHomeTeam": "Liverpool",
     "strAwayTeam": "Brentford",
     "intHomeScore": "3",
     "intRound": "22",
     "intAwayScore": "0",
     "intSpectators": null,
     "strOfficial": "",
     "strTimestamp": "2022-01-16T14:00:00+00:00",
     "dateEvent": "2022-01-16",
     "dateEventLocal": "2022-01-16",
     "strTime": "14:00:00",
     "strTimeLocal": "14:00:00",
     "strTVStation": null,
     "idHomeTeam": "133602",
     "idAwayTeam": "134355",
     "strResult": "",
     "strVenue": "Anfield",
     "strCountry": "England",
     "strCity": "",
     "strPoster": "",
     "strSquare": "",
     "strFanart": null,
     "strThumb": "https://www.thesportsdb.com/images/media/event/thumb/aobf6z1626519699.jpg",
     "strBanner": "",
     "strMap": null,
     "strTweet1": "",
     "strTweet2": "",
     "strTweet3": "",
     "strVideo": "https://www.youtube.com/watch?v=Uph6cc9fMyQ",
     "strStatus": "Match Finished",
     "strPostponed": "no",
     "strLocked": "unlocked"
 },
 */
