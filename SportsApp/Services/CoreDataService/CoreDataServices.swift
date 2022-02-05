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



class CoreDataServices: CoreDataOperations{
    
    var appDelegate: AppDelegate!
    var viewContext : NSManagedObjectContext!
    var entity : NSEntityDescription!
    
    static let shared = CoreDataServices()
    
    private init(){
        self.appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        self.viewContext = self.appDelegate.persistentContainer.viewContext
        self.entity = NSEntityDescription.entity(forEntityName: "LeagueModel", in: self.viewContext)      
    }
    
    func insertLeagues(league: League){

        let newLeague = LeagueModel(entity: self.entity, insertInto: viewContext)
        newLeague.id = league.id
        newLeague.name = league.name
        newLeague.alternateName = league.alternateName
        newLeague.sport = league.sport
        newLeague.badge = league.badge
        newLeague.youtubeLink = league.youtubeLink
        newLeague.currentSeason = league.currentSeason
        
        
        do{
            try viewContext.save()
        }
        catch let error{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchLeagues() -> [League]{
        let fetchRequest = NSFetchRequest<LeagueModel>(entityName: "LeagueModel")
        do{
            let leagues = try viewContext.fetch(fetchRequest)
            return mapLeagueModelToLeague(leagues: leagues)
        }
        catch let error{
            print(error.localizedDescription)
        }
        return []
    }
    
    func fetchLeague(id: String) -> LeagueModel!{
        let fetchRequest = NSFetchRequest<LeagueModel>(entityName: "LeagueModel")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        var leaguesToDelete: [LeagueModel] = []
        do{
            leaguesToDelete = try viewContext.fetch(fetchRequest)
            if leaguesToDelete.count > 0 {
                return leaguesToDelete[0]
            }
            return nil
        }
        catch let error{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func deleteLeague(id: String){
        
        let leagueToDelete = self.fetchLeague(id: id)
        viewContext.delete(leagueToDelete!)
        
        do{
            try viewContext.save()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func clearStorage() {
         
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LeagueModel")
          let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
          do {
              try viewContext.execute(batchDeleteRequest)
                print("DataBase Freed Successfully")
          } catch let error as NSError {
            print("can't free database")

              print(error)
          }
      }
    
    func mapLeagueModelToLeague(leagues: [LeagueModel]) -> [League]{
        return leagues.map { (leagueModel) -> League in
            let newLeague = League()
            newLeague.id = leagueModel.id
            newLeague.name = leagueModel.name
            newLeague.alternateName = leagueModel.alternateName
            newLeague.sport = leagueModel.sport
            newLeague.badge = leagueModel.badge
            newLeague.youtubeLink = leagueModel.youtubeLink
            newLeague.currentSeason = leagueModel.currentSeason
            return newLeague
        }
    }

}
