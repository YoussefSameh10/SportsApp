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
    func showNetworkAlert()
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
    @IBOutlet weak var noUpcomingEventsLabel: UILabel!
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var noTeamsLabel: UILabel!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        showIndicator()
        UpComingEventsCollectionVCSetUp()
        latestResultCollectionVCSetUp()
        teamsCollectionVCSetUp()
        presenterInitialization()
        leagueDetailsPresenter.isFavourite()
        navBarSetup()
        self.title = leagueDetailsPresenter.league.name
    }
    // MARK: - Methods
    
    func presenterInitialization(){
        leagueDetailsPresenter.attachView(view: self)
        leagueDetailsPresenter.getEventsIfConnected()
        leagueDetailsPresenter.getTeamsIfConnected()
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
    
    func showNetworkAlert() {
        let alert = UIAlertController(title: "No Network", message: "There is no internet connection", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func navBarSetup() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    // MARK: - CollectionV dataSource and Delegate
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.UpComingEventsCollectionVC{
            
            return getNumberOfItemsInUpComingEvents()
        }
        else if collectionView == self.latestResultCollectionVC {
            
            return getNumberOfItemsInLatestResults()
        }
        else {
        
            return getNumberOfItemsInTeams()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.UpComingEventsCollectionVC{
            
            return drawUpComingEventsCell(collectionView, indexPath)
        }
        else if collectionView == self.latestResultCollectionVC{
            
            return drawLatestResultCell(collectionView, indexPath)
        }
        else{
            return drawTeamsCell(collectionView, indexPath)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.teamsCollectionVC{
            navigateToTeamsScreen(indexPath: indexPath)
        }
    }
  
    // MARK: - Actions
    
    @IBAction func addToFavourites(_ sender: Any) {
        leagueDetailsPresenter.handleFavouritesButton()
    }
      
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
