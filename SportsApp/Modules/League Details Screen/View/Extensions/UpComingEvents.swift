//
//  UpComingEvents.swift
//  SportsApp
//
//  Created by Amr El Shazly on 10/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController {
    
    func UpComingEventsCollectionVCSetUp(){
        
        UpComingEventsCollectionVC.delegate = self
        UpComingEventsCollectionVC.dataSource = self
        upComingEventsCellSizeSetUp()
    }
    
    func upComingEventsCellSizeSetUp() {
        //(UpComingEventsCollectionVC.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemWidth = self.UpComingEventsCollectionVC.bounds.width/1.3 - 3
        let itemHeight = self.UpComingEventsCollectionVC.bounds.height
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.UpComingEventsCollectionVC.collectionViewLayout = layout
    }
    
    func getNumberOfItemsInUpComingEvents() -> Int {
        leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
        if leagueDetailsPresenter.filteredEvents.count == 0 && leagueDetailsPresenter.events.count != 0{
            let eventsCount = leagueDetailsPresenter.events.count
            leagueDetailsPresenter.filteredEvents.append(contentsOf: leagueDetailsPresenter.events[eventsCount/2...eventsCount - 1])
        }
        if leagueDetailsPresenter.filteredEvents.count == 0 {
            self.UpComingEventsCollectionVC.isHidden = true
            self.noUpcomingEventsLabel.isHidden = false
        }
        else{
            self.UpComingEventsCollectionVC.isHidden = false
            self.noUpcomingEventsLabel.isHidden = true
        }
        return leagueDetailsPresenter.filteredEvents.count
    }
    
    func drawUpComingEventsCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! eventsCell
        cell.layer.cornerRadius = 50
        leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
        if leagueDetailsPresenter.filteredEvents.count == 0 && leagueDetailsPresenter.events.count != 0{
            let eventsCount = leagueDetailsPresenter.events.count
            leagueDetailsPresenter.filteredEvents.append(contentsOf: leagueDetailsPresenter.events[eventsCount/2...eventsCount - 1])
        }
        eventsCellSetUp(cell, indexPath)
        return cell
    }
}

