//
//  LeagueModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import CoreData


enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

class LeagueModel: NSManagedObject, Decodable{
    
    
    enum CodingKeys: String, CodingKey{
        case id = "idLeague"
        case name = "strLeague"
    }
    
    
    required convenience init(from decoder: Decoder) throws{
        let coreDataService: CoreDataDecodable = CoreDataServices()
        let dec = coreDataService.decoder
        guard let context = dec.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else{
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    
}

