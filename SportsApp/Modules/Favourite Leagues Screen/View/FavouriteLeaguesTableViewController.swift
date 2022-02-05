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

    let indicator = UIActivityIndicatorView(style: .medium)
    var favouriteLeaguesPresenter: FavouriteLeaguesPresenter!
    
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
        cell.badge.kf.setImage(with: URL(string: favouriteLeaguesPresenter.leagues[indexPath.row].badge!))
        cell.name.text = favouriteLeaguesPresenter.leagues[indexPath.row].name
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
