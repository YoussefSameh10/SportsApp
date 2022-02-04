//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit
import Kingfisher

private let cellReuseIdentifier = "Cell"

class LeaguesTableViewController: UITableViewController {

    @IBOutlet var leaguesTable: UITableView!
    
    
    var leaguesPresenter: LeaguesTablePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Leagues"
        leaguesPresenter.attachView(viewController: self)
        leaguesPresenter.getLeagues()
    
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
        cell.badge.kf.setImage(with: URL(string: leaguesPresenter.leagues[indexPath.row].badge))
        cell.name.text = leaguesPresenter.leagues[indexPath.row].name

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Amr", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsVC.leagueDetailsPresenter = LeagueDetailsPresenter(apiServices: APIServices())
        leagueDetailsVC.leagueDetailsPresenter.leagueID = leaguesPresenter.leagues[indexPath.row].id
        self.navigationController?.pushViewController(leagueDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/6
    }
    
    
        
    
}
