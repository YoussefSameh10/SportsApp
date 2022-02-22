//
//  LatestResults.swift
//  SportsApp
//
//  Created by Amr El Shazly on 10/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController {

    func latestResultCollectionVCSetUp(){
        
        latestResultCollectionVC.delegate = self
        latestResultCollectionVC.dataSource = self
        latestResultCellSizeSetUp()
        
    }
    
    func latestResultCellSizeSetUp() {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = self.latestResultCollectionVC.bounds.width - 54
        let itemHeight = self.latestResultCollectionVC.bounds.height / 1.7 - 12
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        //layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        self.latestResultCollectionVC.collectionViewLayout = layout
    }
    
    func getNumberOfItemsInLatestResults() -> Int {
        leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
        if leagueDetailsPresenter.filteredEvents.count == 0 {
            self.latestResultCollectionVC.isHidden = true
            self.noResultsLabel.isHidden = false
        }
        else{
            self.latestResultCollectionVC.isHidden = false
            self.noResultsLabel.isHidden = true
        }
        return leagueDetailsPresenter.filteredEvents.count
    }
    
    func drawLatestResultCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResultCell", for: indexPath) as! eventsCell
        cell.layer.cornerRadius = 30
        leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
        eventsCellSetUp(cell, indexPath)
        return cell
    }
}
