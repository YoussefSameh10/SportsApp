//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Youssef on 2/4/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

protocol TeamDetailsView{
    
}

class TeamDetailsViewController: UIViewController, TeamDetailsView {

    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var jerseyImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var establishmentYear: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    
    var teamPresenter: TeamPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamPresenter = TeamDetailsPresenter()
        teamPresenter.attachView(teamDetailsView: self)
        
        stadiumImage.kf.setImage(with: URL(string: teamPresenter.team.stadiumImage))
        logoImage.kf.setImage(with: URL(string: teamPresenter.team.teamBadge))
        jerseyImage.kf.setImage(with: URL(string: teamPresenter.team.teamJersey))
        name.text = teamPresenter.team.name
        establishmentYear.text = teamPresenter.team.establishmentYear
        stadiumName.text = teamPresenter.team.stadium
        
        
        // Do any additional setup after loading the view.
    }
}
