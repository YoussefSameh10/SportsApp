//
//  ParentLeaguesTableViewController.swift
//  SportsApp
//
//  Created by Youssef on 2/7/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"


class ParentLeaguesTableViewController: UITableViewController, LeaguesView {
    
    
    
    let indicator = UIActivityIndicatorView(style: .medium)
    var leaguesPresenter: LeaguesPresenter!
    
    
    func showNetworkAlert() {
        let alert = UIAlertController(title: "No Network", message: "There is no internet connection", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
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
        return leaguesPresenter.leagues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! LeagueCell

        // Configure the cell...
        //cell.badge.kf.setImage(with: URL(string: leaguesPresenter.leagues[indexPath.row].badge))
        if leaguesPresenter.leagues[indexPath.row].badge != nil {
            cell.badge.kf.setImage(with: URL(string: leaguesPresenter.leagues[indexPath.row].badge), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            cell.badge.image = UIImage(named: "brokenImage.png")
        }
        
        cell.name.text = leaguesPresenter.leagues[indexPath.row].name
        cell.url = leaguesPresenter.leagues[indexPath.row].youtubeLink
        cell.showAlert = showAlert
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Amr", bundle: nil)
        let leagueDetailsNavController = storyboard.instantiateViewController(withIdentifier: "LeagueDetailsNavigationController") as! UINavigationController
        let leagueDetailsVC = leagueDetailsNavController.viewControllers.first as! LeagueDetailsViewController
        leagueDetailsVC.leagueDetailsPresenter = LeagueDetailsPresenter(apiServices: APIServices())
        leagueDetailsVC.leagueDetailsPresenter.league = leaguesPresenter.leagues[indexPath.row]
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
    
    func reloadTable(){
        self.tableView.reloadData()
    }
    func stopIndicator() {
        indicator.stopAnimating()
    }
}
