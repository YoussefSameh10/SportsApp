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
    func showNetworkAlert()
}

class LeaguesTableViewController: ParentLeaguesTableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(leaguesPresenter.sportName!) Leagues"
        startIndicator()
        leaguesPresenter.attachView(viewController: self)
        leaguesPresenter.getLeaguesIfConnected()
        
    
    }
    
    
    
}


