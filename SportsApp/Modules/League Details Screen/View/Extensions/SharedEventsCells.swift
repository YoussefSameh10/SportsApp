//
//  SharedEventsCells.swift
//  SportsApp
//
//  Created by Amr El Shazly on 10/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController {
    
    func eventsCellSetUp(_ cell: eventsCell, _ indexPath: IndexPath) {
        
        showingAndHidingEventsCellsLabels(cell, noEvents: false)
        roundSetUp(cell, indexPath)
        eventImageSetUp(indexPath, cell)
        teamsNamesSetUp(cell,indexPath)
        scoreSetUp(cell,indexPath)
        dateAndTimeSetUp(cell, indexPath)
    }
    
    func showingAndHidingEventsCellsLabels(_ cell: eventsCell, noEvents: Bool) {
        //cell.noEventsLabel.isHidden = !noEvents
        cell.eventDateLabel.isHidden = noEvents
        cell.eventRoundLabel.isHidden = noEvents
        //cell.eventImage.isHidden = noEvents
        cell.eventTimeLabel.isHidden = noEvents
        cell.eventResultLabel.isHidden = noEvents
        cell.teamsNameLabel.isHidden = noEvents
    }
    
    func roundSetUp(_ cell : eventsCell , _ indexPath : IndexPath){
        let round = leagueDetailsPresenter.filteredEvents[indexPath.row].round ?? ""
        cell.eventRoundLabel.text = "Round \(round) "
    }
    
    func eventImageSetUp(_ indexPath: IndexPath, _ cell: eventsCell) {
        if leagueDetailsPresenter.filteredEvents[indexPath.row].teamVsTeamImage != nil {
            
            cell.eventImage.kf.setImage(with: URL(string: leagueDetailsPresenter.filteredEvents[indexPath.row].teamVsTeamImage!), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            cell.eventImage.image = UIImage(named: "brokenImage.png")
        }
    }
    
    func teamsNamesSetUp( _ cell: eventsCell, _ indexPath : IndexPath) {
        let homeTeam = leagueDetailsPresenter.filteredEvents[indexPath.row].homeTeam ?? ""
        let awayTeam = leagueDetailsPresenter.filteredEvents[indexPath.row].awayTeam ?? ""
        if homeTeam == "" {
            cell.teamsNameLabel.text = "No Teams (Individual Sport)"
        }
        else{
            cell.teamsNameLabel.text = "\(homeTeam)  VS  \(awayTeam)"
        }
    }
    
    func scoreSetUp( _ cell: eventsCell , _ indexPath : IndexPath) {
        let homeScore = leagueDetailsPresenter.filteredEvents[indexPath.row].homeScore ?? ""
        let awayScore = leagueDetailsPresenter.filteredEvents[indexPath.row].awayScore ?? ""
        if awayScore == ""
        {
            cell.eventResultLabel.text = "-"
        }else{
            cell.eventResultLabel.text = "\(homeScore) - \(awayScore)"
        }
    }
    
    func dateAndTimeSetUp(_ cell: eventsCell, _ indexPath: IndexPath) {
        cell.eventDateLabel.text = leagueDetailsPresenter.filteredEvents[indexPath.row].date
        cell.eventTimeLabel.text = leagueDetailsPresenter.filteredEvents[indexPath.row].time
    }
    
    
}
