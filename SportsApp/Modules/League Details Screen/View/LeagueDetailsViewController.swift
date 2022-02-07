//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Amr El Shazly on 03/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit
import Kingfisher

protocol LeagueDetailsView : AnyObject{
    func hideIndicator ()
    func renderingData ()
    func setFavouritesButton(imageName: String)
}

class LeagueDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,LeagueDetailsView{
    
    // MARK: - Properties
   
    let indicator = UIActivityIndicatorView(style: .large)
    var leagueDetailsPresenter : LeaguePresenter!
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var UpComingEventsCollectionVC: UICollectionView!
    @IBOutlet weak var latestResultCollectionVC: UICollectionView!
    @IBOutlet weak var teamsCollectionVC: UICollectionView!
   
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.modalPresentationStyle = .fullScreen
    
        showIndicator()
        
        UpComingEventsCollectionVCSetUp()
        latestResultCollectionVCSetUp()
        teamsCollectionVCSetUp()
        
        presenterInitialization()
        
        leagueDetailsPresenter.isFavourite()
        self.title = leagueDetailsPresenter.league.name
        
        
        //upComingEvents = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
        
  
    }
    // MARK: - Methods
    
    func UpComingEventsCollectionVCSetUp(){
        UpComingEventsCollectionVC.delegate = self
        UpComingEventsCollectionVC.dataSource = self
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
    func latestResultCollectionVCSetUp(){
        latestResultCollectionVC.delegate = self
        latestResultCollectionVC.dataSource = self
        let layout = UICollectionViewFlowLayout()
        let itemWidth = self.UpComingEventsCollectionVC.bounds.width
        let itemHeight = self.UpComingEventsCollectionVC.bounds.height / 1.3 - 3
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.latestResultCollectionVC.collectionViewLayout = layout
        
    }
    func teamsCollectionVCSetUp(){
        teamsCollectionVC.delegate = self
        teamsCollectionVC.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemWidth = self.UpComingEventsCollectionVC.bounds.width / 3
        let itemHeight = self.UpComingEventsCollectionVC.bounds.height
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.teamsCollectionVC.collectionViewLayout = layout
        
    }
    func presenterInitialization(){
        leagueDetailsPresenter.attachView(view: self)
        leagueDetailsPresenter.getEvents()
        leagueDetailsPresenter.getTeams()
    }
    func showIndicator (){
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    func hideIndicator (){
        indicator.stopAnimating()
    }
    func renderingData (){
        self.UpComingEventsCollectionVC.reloadData()
        self.latestResultCollectionVC.reloadData()
        self.teamsCollectionVC.reloadData()
    }
    
    func setFavouritesButton(imageName: String){
        favouriteButton.setBackgroundImage(UIImage(systemName: imageName), for: .normal, barMetrics: .default)
    }
    
    
    // MARK: - CollectionV dataSource and Delegate
    
    fileprivate func showingAndHidingEventsCellsLabels(_ cell: eventsCell, noEvents: Bool) {
        cell.noEventsLabel.isHidden = !noEvents
        cell.eventDateLabel.isHidden = noEvents
        cell.eventRoundLabel.isHidden = noEvents
        //cell.eventImage.isHidden = noEvents
        cell.eventTimeLabel.isHidden = noEvents
        cell.eventResultLabel.isHidden = noEvents
        cell.teamsNameLabel.isHidden = noEvents
    }
    fileprivate func showingAndHidingTeamsCellsLabels(_ cell: TeamsCell, noTeams: Bool) {
        cell.noTeamsLabel.isHidden = !noTeams
        cell.teamImage.isHidden = noTeams
    }
    
    fileprivate func eventsCellSetUp(_ cell: eventsCell, _ indexPath: IndexPath) {
        
        showingAndHidingEventsCellsLabels(cell, noEvents: false)
        
        let homeScore = leagueDetailsPresenter.filteredEvents[indexPath.row].homeScore ?? ""
        let awayScore = leagueDetailsPresenter.filteredEvents[indexPath.row].awayScore ?? ""
        let round = leagueDetailsPresenter.filteredEvents[indexPath.row].round ?? ""
        let homeTeam = leagueDetailsPresenter.filteredEvents[indexPath.row].homeTeam ?? ""
        let awayTeam = leagueDetailsPresenter.filteredEvents[indexPath.row].awayTeam ?? ""
        
        cell.eventRoundLabel.text = "Round \(round) "
        
        if leagueDetailsPresenter.filteredEvents[indexPath.row].teamVsTeamImage != nil {
        
            cell.eventImage.kf.setImage(with: URL(string: leagueDetailsPresenter.filteredEvents[indexPath.row].teamVsTeamImage!), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            cell.eventImage.image = UIImage(named: "brokenImage.png")
        }
        
        if homeTeam == "" {
            cell.teamsNameLabel.text = "No Teams (Individual Sport)"
        }
        else{
            cell.teamsNameLabel.text = "\(homeTeam) vs \(awayTeam)"
        }
        
       
        if awayScore == ""
        {
            cell.eventResultLabel.text = "-"
        }else{
            cell.eventResultLabel.text = "\(homeScore) - \(awayScore)"
        }
        
        cell.eventDateLabel.text = leagueDetailsPresenter.filteredEvents[indexPath.row].date
        cell.eventTimeLabel.text = leagueDetailsPresenter.filteredEvents[indexPath.row].time
    }
    
    fileprivate func teamsCellSetUp(_ indexPath: IndexPath, _ cell: TeamsCell) {
        showingAndHidingTeamsCellsLabels(cell, noTeams: false)
        if leagueDetailsPresenter.teams[indexPath.row].teamBadge != nil {
            cell.teamImage.kf.setImage(with: URL(string: leagueDetailsPresenter.teams[indexPath.row].teamBadge), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            cell.teamImage.image = UIImage(named: "brokenImage.png")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.UpComingEventsCollectionVC{
            
            leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
            print("no of items in upcoming events VC = \(leagueDetailsPresenter.filteredEvents.count ?? 0)")
            if leagueDetailsPresenter.filteredEvents.count == 0 {
                return 1
            }
            return leagueDetailsPresenter.filteredEvents.count ?? 0
        }
        else if collectionView == self.latestResultCollectionVC {
            //else if collectionView == self.latestResultCollectionVC
            leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
            print("no of items in latest reasult VC = \(leagueDetailsPresenter.filteredEvents.count ?? 0)")
            if leagueDetailsPresenter.filteredEvents.count == 0 {
                return 1
            }
            return leagueDetailsPresenter.filteredEvents.count ?? 0
            
        }
        else {
            print("number of teams \(leagueDetailsPresenter.teams.count)")
            
            if leagueDetailsPresenter.teams.count == 0 {
                return 1
            }
            return leagueDetailsPresenter.teams.count
        }
        //return events?.count ?? 0
    }
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.UpComingEventsCollectionVC{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! eventsCell
            leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
            
            if leagueDetailsPresenter.filteredEvents.count != 0 {
                eventsCellSetUp(cell, indexPath)
            }
            else{
                showingAndHidingEventsCellsLabels(cell, noEvents: true)
            }
            

            return cell
           
        }
        else if collectionView == self.latestResultCollectionVC{
            
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResultCell", for: indexPath) as! eventsCell
            leagueDetailsPresenter.filteredEvents = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
            if leagueDetailsPresenter.filteredEvents.count != 0 {
                eventsCellSetUp(cell, indexPath)
            }
            else{
                showingAndHidingEventsCellsLabels(cell, noEvents: true)
            }
//            print(events?[indexPath.row].time! ?? "time=nil")
//            print(events?[indexPath.row].awayTeam! ?? "awayTeam=nil")
            return cell
          
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
            
            if leagueDetailsPresenter.teams.count != 0 {
                teamsCellSetUp(indexPath, cell)
            }
            
            else {
                showingAndHidingTeamsCellsLabels(cell, noTeams: true)
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.teamsCollectionVC{
            let storyboard = UIStoryboard(name: "Youssef", bundle: nil)
            let teamVC = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
            teamVC.teamPresenter = TeamDetailsPresenter()
            teamVC.teamPresenter.team = leagueDetailsPresenter.teams[indexPath.row]
            self.navigationController?.pushViewController(teamVC, animated: true)
        }
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height:500)
//    }
    
    

    // MARK: - Actions
    
    @IBAction func addToFavourites(_ sender: Any) {
        leagueDetailsPresenter.handleFavouritesButton()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
