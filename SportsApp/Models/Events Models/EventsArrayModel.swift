//
//  EventsArrayModel.swift
//  SportsApp
//
//  Created by Youssef on 1/31/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class EventsArrayModel: Decodable{
    var eventsArray: [EventModel]!
    enum CodingKeys: String, CodingKey{
        case eventsArray = "results"
    }
}
