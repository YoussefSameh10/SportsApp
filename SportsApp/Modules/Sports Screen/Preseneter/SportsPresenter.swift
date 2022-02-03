//
//  SportsPresenter.swift
//  SportsApp
//
//  Created by Amr El Shazly on 02/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class SportsPreseneter {
    
    // MARK: - Properties
    var sportsView : SportsView!
    var apiServices : APIServices!
    var sports : [Sport] = []
    
    // MARK: - Init
    init(apiServices : APIServices){
        self.apiServices = apiServices
    }
    // MARK: - Methods
    func attachView(view: SportsView){
        self.sportsView = view
    }
    func getSports () {
        apiServices.getSports(responseDidArrive: sportsResponseDidArrive)
        
    }
    
    func sportsResponseDidArrive(sports: [Sport]?){
        
        self.sports = sports!
        //print("presenter here")
        //print(self.sports.count)
        DispatchQueue.main.async {
            self.sportsView.hideIndicator()
            self.sportsView.renderSportsData()
        }
        
    }
    
}
