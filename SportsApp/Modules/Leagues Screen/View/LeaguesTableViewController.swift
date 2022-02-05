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

protocol LeaguesView{
    func stopIndicator()
    func reloadTable()
}

class LeaguesTableViewController: UITableViewController {

    @IBOutlet var leaguesTable: UITableView!
    
    let indicator = UIActivityIndicatorView(style: .medium)
    var leaguesPresenter: LeaguesTablePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leagues"
        
        startIndicator()
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
        cell.url = leaguesPresenter.leagues[indexPath.row].youtubeLink
        
        if(cell.url == ""){
            cell.youtubeButton.isEnabled = false
        }
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
}

extension LeaguesTableViewController: LeaguesView{
    func reloadTable(){
        leaguesTable.reloadData()
    }
    func stopIndicator() {
        indicator.stopAnimating()
    }

}
