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
    
    // MARK: - Properties
    
    var teamPresenter: TeamPresenter!
    
    // MARK: - Outlets
    
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var jerseyImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var establishmentYear: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamPresenter.attachView(teamDetailsView: self)
        teamLabelsSetUp()
        navBarSetup()
        
    
    }
    
    // MARK: - Methods
    
    func teamLabelsSetUp() {
        
        stadiumImageSetUp()
        logoImageSetUp()
        teamJersySetUp()
        teamNameSetUp()
        stadiumNameSetUp()
        establishmentYearSetUp()
        
    }
    
    func stadiumImageSetUp() {
        if teamPresenter.team.stadiumImage != nil {
            stadiumImage.kf.setImage(with: URL(string: teamPresenter.team.stadiumImage), placeholder: UIImage(named: "stadiumPlaceholder-1"))
        }
        else{
            stadiumImage.image = UIImage(named: "stadiumPlaceholder-1")
        }
    }
    
    func logoImageSetUp() {
        if teamPresenter.team.teamBadge != nil {
            logoImage.kf.setImage(with: URL(string: teamPresenter.team.teamBadge), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            logoImage.image = UIImage(named: "brokenImage.png")
        }
    }
    
    func teamJersySetUp() {
        if teamPresenter.team.teamJersey != nil {
            jerseyImage.kf.setImage(with: URL(string: teamPresenter.team.teamJersey), placeholder: UIImage(named: "brokenImage.png"))
        }
        else{
            jerseyImage.image = UIImage(named: "brokenImage.png")
        }
    }
    
    func teamNameSetUp() {
        if teamPresenter.team.name == "" {
            name.text = "Name Not Available"
        }
        else{
            name.text = teamPresenter.team.name
        }
    }
    
    func stadiumNameSetUp() {
        if teamPresenter.team.stadium == "" || teamPresenter.team.stadium == nil || teamPresenter.team.stadium == " "{
            stadiumName.text = "This team has no stadium"
        }
        else{
            stadiumName.text = teamPresenter.team.stadium
        }
    }
    
    func establishmentYearSetUp() {
        if teamPresenter.team.establishmentYear == "" || teamPresenter.team.establishmentYear == "0" || teamPresenter.team.establishmentYear == nil ||
            teamPresenter.team.establishmentYear == " "{
            establishmentYear.text = "Unknown"
        }
        else{
            establishmentYear.text = teamPresenter.team.establishmentYear
        }
    }
    
    func navBarSetup() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    @IBAction func openWebsite(_ sender: Any) {
        let url = "https://\(teamPresenter.team.website!)"
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
    @IBAction func openFacebook(_ sender: Any) {
        let url = "https://\(teamPresenter.team.facebookLink!)"
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
    @IBAction func openTwitter(_ sender: Any) {
        let url = "https://www.\(teamPresenter.team.twitterLink!)"
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
    @IBAction func openInstagram(_ sender: Any) {
        let url = "https://www.\(teamPresenter.team.instagramLink!)"
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
}
