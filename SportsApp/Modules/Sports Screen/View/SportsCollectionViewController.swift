//
//  SportsCollectionViewController.swift
//  SportsApp
//
//  Created by Amr El Shazly on 02/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

protocol SportsView : AnyObject{
    func hideIndicator()
    func renderSportsData()
    func showNetworkAlert()
}

private let reuseIdentifier = "Cell"

class SportsCollectionViewController: UICollectionViewController,SportsView {
    
    // MARK: - Properties
    let indicator = UIActivityIndicatorView(style: .large)
    var sportsPresenter : SportsPresenterProtocol!
    
    // MARK: - Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportsCellSetUp()
        self.title = "Sports"
        showIndicator()
        //sportsPresenter = SportsPreseneter(apiServices: APIServices())
        sportsPresenter = AppDependencies.sportsPresenter
        sportsPresenter.attachView(view: self)
        
        sportsPresenter.getSportsIfConnected()
        
        self.tabBarController?.tabBar.items?[1].title = "Favourites"
        self.tabBarController?.tabBar.items?[1].image = UIImage(systemName: "star")
    
        navBarSetup()
    }
    
    // MARK: - Methods
    func showIndicator (){
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    func hideIndicator (){
        indicator.stopAnimating()
    }
    func renderSportsData (){
        self.collectionView.reloadData()
    }
    func sportsCellSetUp() {
        let itemSize = UIScreen.main.bounds.width/2 - 3
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionView.collectionViewLayout = layout
    }
    
    func cellLabelsSetUp(_ cell: SportsCustomCollectionViewCell, _ indexPath: IndexPath) {
        cell.sportNameLabel.text = sportsPresenter.sports[indexPath.row].name!
        cell.sportImage.kf.setImage(with : URL(string: sportsPresenter.sports[indexPath.row].logo), placeholder: UIImage(named: "brokenImage.png"))
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
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sportsPresenter.sports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCustomCollectionViewCell
        cellLabelsSetUp(cell, indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Youssef", bundle: nil)
        let leaguesVC = storyboard.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        //leaguesVC.leaguesPresenter = LeaguesTablePresenter(apiService: APIServices())
        leaguesVC.leaguesPresenter = AppDependencies.leaguesPresenter
        leaguesVC.leaguesPresenter.sportName = sportsPresenter.sports[indexPath.row].name
        self.navigationController?.pushViewController(leaguesVC, animated: true)
    }
    
}
