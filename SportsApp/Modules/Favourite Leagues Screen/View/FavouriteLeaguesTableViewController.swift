//
//  FavouriteLeaguesTableViewController.swift
//  SportsApp
//
//  Created by Youssef on 2/3/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"
    
protocol FavouriteLeaguesView{
    func stopIndicator()
    func reloadTable()
}

class FavouriteLeaguesTableViewController: UITableViewController, FavouriteLeaguesView {

    // MARK: - Properties
    let indicator = UIActivityIndicatorView(style: .medium)
    var favouriteLeaguesPresenter: FavouriteLeaguesPresenter!
    
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        favouriteLeaguesPresenter.getLeagues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarItem.image = UIImage(named: "favourites.png")
        startIndicator()
        //REMEMBER TO REMOVE WHEN LINKING
        favouriteLeaguesPresenter = FavouriteLeaguesTablePresenter()
        
        favouriteLeaguesPresenter.attachView(viewController: self)
        
    }

    func showAlert(){
        let alert = UIAlertController(title: "Not found", message: "this league has no YouTube channel", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favouriteLeaguesPresenter.leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! LeagueCell
        
        // Configure the cell...
        if favouriteLeaguesPresenter.leagues[indexPath.row].badge != nil {
            cell.badge.kf.setImage(with: URL(string: favouriteLeaguesPresenter.leagues[indexPath.row].badge!), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            cell.badge.image = UIImage(named: "brokenImage.png")
        }
        
        cell.name.text = favouriteLeaguesPresenter.leagues[indexPath.row].name
        cell.url = favouriteLeaguesPresenter.leagues[indexPath.row].youtubeLink
        cell.showAlert = showAlert
        
        if(cell.url == ""){
            //cell.youtubeButton.isHidden = true
        }
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Amr", bundle: nil)
        let leagueDetailsNavController = storyboard.instantiateViewController(withIdentifier: "LeagueDetailsNavigationController") as! UINavigationController
        let leagueDetailsVC = leagueDetailsNavController.viewControllers.first as! LeagueDetailsViewController
        leagueDetailsVC.leagueDetailsPresenter = LeagueDetailsPresenter(apiServices: APIServices())
        leagueDetailsVC.leagueDetailsPresenter.league = favouriteLeaguesPresenter.leagues[indexPath.row]
        self.present(leagueDetailsNavController, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/8
    }
    
    func startIndicator() {
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
}

extension FavouriteLeaguesTableViewController: LeaguesView{
    func reloadTable(){
        self.tableView.reloadData()
    }
    func stopIndicator() {
        indicator.stopAnimating()
    }
}
