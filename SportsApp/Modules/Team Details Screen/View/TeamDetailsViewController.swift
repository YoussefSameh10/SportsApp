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
        
        teamPresenter.attachView(teamDetailsView: self)
        teamLabelsSetUp()
    }
    
    fileprivate func teamLabelsSetUp() {
        if teamPresenter.team.stadiumImage != nil {
            stadiumImage.kf.setImage(with: URL(string: teamPresenter.team.stadiumImage), placeholder: UIImage(named: "stadiumPlaceholder.png"))
        }
        else{
            stadiumImage.image = UIImage(named: "stadiumPlaceholder.png")
        }
        
        if teamPresenter.team.teamBadge != nil {
            logoImage.kf.setImage(with: URL(string: teamPresenter.team.teamBadge), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            logoImage.image = UIImage(named: "brokenImage.png")
        }
        
        if teamPresenter.team.teamJersey != nil {
            jerseyImage.kf.setImage(with: URL(string: teamPresenter.team.teamJersey), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            jerseyImage.image = UIImage(named: "brokenImage.png")
        }
        
        if teamPresenter.team.name == "" {
            name.text = "Name Not Available"
        }
        else{
            name.text = teamPresenter.team.name
        }
        if teamPresenter.team.stadium == "" {
            stadiumName.text = "This team has no stadium"
        }
        else{
            stadiumName.text = teamPresenter.team.stadium
        }
        if teamPresenter.team.establishmentYear == "" || teamPresenter.team.establishmentYear == "0" {
            establishmentYear.text = "Unknown"
        }
        else{
            establishmentYear.text = teamPresenter.team.establishmentYear
        }
    }
}
