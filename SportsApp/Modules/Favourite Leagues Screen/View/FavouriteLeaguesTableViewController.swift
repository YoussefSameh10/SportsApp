//
//  FavouriteLeaguesTableViewController.swift
//  SportsApp
//
//  Created by Youssef on 2/3/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"
    

class FavouriteLeaguesTableViewController: ParentLeaguesTableViewController {

   
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        leaguesPresenter.getLeagues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarItem.image = UIImage(named: "favourites.png")
        startIndicator()
        
        leaguesPresenter = FavouriteLeaguesTablePresenter()
        
        leaguesPresenter.attachView(viewController: self)
        
    }

}
