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
    var events : [Event]?

    
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
        (UpComingEventsCollectionVC.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
    }
    func latestResultCollectionVCSetUp(){
        latestResultCollectionVC.delegate = self
        latestResultCollectionVC.dataSource = self
        
    }
    func teamsCollectionVCSetUp(){
        teamsCollectionVC.delegate = self
        teamsCollectionVC.dataSource = self
        (teamsCollectionVC.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        
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
    
    fileprivate func eventsCellSetUp(_ cell: eventsCell, _ indexPath: IndexPath) {
        
        let homeScore = events?[indexPath.row].homeScore ?? ""
        let awayScore = events?[indexPath.row].awayScore ?? ""
        let round = events?[indexPath.row].round
        
        cell.eventRoundLabel.text = "Round \(round!) "
        cell.eventImage.kf.setImage(with: URL(string: events?[indexPath.row].teamVsTeamImage ?? ""))
        if awayScore == ""
        {
            cell.eventResultLabel.text = ""
        }else{
            cell.eventResultLabel.text = "\(homeScore) - \(awayScore)"
        }
        
        cell.eventDateLabel.text = events?[indexPath.row].date
        cell.eventTimeLabel.text = events?[indexPath.row].time
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.UpComingEventsCollectionVC{
            
            events = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
            print("no of items in upcoming events VC = \(events?.count ?? 0)")
            return events?.count ?? 0
        }
        else if collectionView == self.latestResultCollectionVC {
            //else if collectionView == self.latestResultCollectionVC
            events = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
            print("no of items in latest reasult VC = \(events?.count ?? 0)")
            return events?.count ?? 0
            
        }
        else {
            print("number of teams \(leagueDetailsPresenter.teams.count)")
            return leagueDetailsPresenter.teams.count
        }
        //return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.UpComingEventsCollectionVC{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! eventsCell
            events = leagueDetailsPresenter.events.filter { $0.awayScore == nil}
            eventsCellSetUp(cell, indexPath)
            print(events?[indexPath.row].time! ?? "time=nil")
            print(events?[indexPath.row].awayTeam! ?? "awayTeam=nil")
            return cell
           
        }
        else if collectionView == self.latestResultCollectionVC{
            
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResultCell", for: indexPath) as! eventsCell
            events = leagueDetailsPresenter.events.filter { $0.awayScore != nil}
            eventsCellSetUp(cell, indexPath)
            print(events?[indexPath.row].time! ?? "time=nil")
            print(events?[indexPath.row].awayTeam! ?? "awayTeam=nil")
             return cell
          
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
            cell.teamImage.kf.setImage(with: URL(string: leagueDetailsPresenter.teams[indexPath.row].teamBadge))
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height:500)
    }
    
    

    // MARK: - Actions
    
    @IBAction func addToFavourites(_ sender: Any) {
        leagueDetailsPresenter.handleFavouritesButton()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
