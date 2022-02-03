//
//  SportsCollectionViewController.swift
//  SportsApp
//
//  Created by Amr El Shazly on 02/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit
import Kingfisher

protocol SportsView : AnyObject{
    func hideIndicator ()
    func renderSportsData ()
}

private let reuseIdentifier = "Cell"

class SportsCollectionViewController: UICollectionViewController,SportsView {

    // MARK: - Properties
    let indicator = UIActivityIndicatorView(style: .large)
    var sportsPresenter : SportsPreseneter!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "Sports"
        showIndicator()
        sportsPresenter = SportsPreseneter(apiServices: APIServices())
        sportsPresenter.attachView(view: self)
        sportsPresenter.getSports()

        print("------------------------")
        //print(sportsPresenter.sports.count)
        //print(sportsPresenter.sports[0].name!)
        
    }

    // MARK: - Methods
    func showIndicator (){
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    func hideIndicator (){
        indicator.stopAnimating()
    }
    func renderSportsData (){
        self.collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("items in sections")
        return sportsPresenter.sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCustomCollectionViewCell
    
        cell.sportNameLabel.text = sportsPresenter.sports[indexPath.row].name!
        print(cell.sportNameLabel.text!)
        cell.sportImage.kf.setImage(with : URL(string: sportsPresenter.sports[indexPath.row].logo))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
//        let storyboard = UIStoryboard(name: "Youssef", bundle: nil)
//        let leaguesVC = storyboard.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
//        leaguesVC.presenter.sportName = sportsPresenter.sports[indexPath.row].name
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/4, height:UIScreen.main.bounds.height/2)
    }

  

}
