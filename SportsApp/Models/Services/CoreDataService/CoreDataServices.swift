//
//  CoreDataServices.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}



class CoreDataServices: CoreDataOperations, CoreDataDecodable{
    
    var appDelegate: AppDelegate!
    var viewContext : NSManagedObjectContext!
    var entity : NSEntityDescription!
    var decoder = JSONDecoder()
    
    init(){
        
        self.appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        self.viewContext = self.appDelegate.persistentContainer.viewContext
        self.entity = NSEntityDescription.entity(forEntityName: "LeagueModel", in: self.viewContext)
        self.decoder.userInfo[CodingUserInfoKey.managedObjectContext] = self.viewContext
    }
    
    func insertLeagues(){
        let leagues = self.fetchLeagues()
        for league in leagues{
            self.deleteLeague(league: league)
        }
        do{
            try viewContext.save()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func fetchLeagues() -> [LeagueModel]{
        let fetchRequest = NSFetchRequest<LeagueModel>(entityName: "LeagueModel")
        do{
            return try viewContext.fetch(fetchRequest)
        }
        catch let error{
            print(error.localizedDescription)
        }
        return []
    }
    
    func deleteLeague(league: LeagueModel){
        viewContext.delete(league)
        
        do{
            try viewContext.save()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
}
