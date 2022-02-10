//
//  Teams.swift
//  SportsApp
//
//  Created by Amr El Shazly on 10/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController {

    func teamsCollectionVCSetUp(){
        teamsCollectionVC.delegate = self
        teamsCollectionVC.dataSource = self
        teamsCellSizeSetUp()
        teamsCollectionVC.layer.cornerRadius = 30
        
    }
    
    func teamsCellSizeSetUp() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemWidth = self.UpComingEventsCollectionVC.bounds.width / 3
        let itemHeight = self.UpComingEventsCollectionVC.bounds.height / 2 - 3
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.teamsCollectionVC.collectionViewLayout = layout
    }
    
    func showingAndHidingTeamsCellsLabels(_ cell: TeamsCell, noTeams: Bool) {
       cell.noTeamsLabel.isHidden = !noTeams
       cell.teamImage.isHidden = noTeams
   }
    
    func teamsCellSetUp(_ indexPath: IndexPath, _ cell: TeamsCell) {
       showingAndHidingTeamsCellsLabels(cell, noTeams: false)
       if leagueDetailsPresenter.teams[indexPath.row].teamBadge != nil {
           cell.teamImage.kf.setImage(with: URL(string: leagueDetailsPresenter.teams[indexPath.row].teamBadge), placeholder: UIImage(named: "brokenImage.png"))
       }
       else{
           cell.teamImage.image = UIImage(named: "brokenImage.png")
       }
   }
    
    func getNumberOfItemsInTeams() -> Int {
        if leagueDetailsPresenter.teams.count == 0 {
            return 1
        }
        return leagueDetailsPresenter.teams.count
    }
    
    func drawTeamsCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
        
        if leagueDetailsPresenter.teams.count != 0 {
            teamsCellSetUp(indexPath, cell)
        }
        
        else {
            showingAndHidingTeamsCellsLabels(cell, noTeams: true)
        }
        return cell
    }
    
    func navigateToTeamsScreen(indexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Youssef", bundle: nil)
        let teamVC = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        teamVC.teamPresenter = TeamDetailsPresenter()
        teamVC.teamPresenter.team = leagueDetailsPresenter.teams[indexPath.row]
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    
    
}
