//
//  SportsPresenter.swift
//  SportsApp
//
//  Created by Amr El Shazly on 02/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
protocol SportsPresenterProtocol{
    var sports : [Sport] {get}
    func attachView(view: SportsView)
    func getSportsIfConnected()
}

class SportsPreseneter : SportsPresenterProtocol{
    
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
        
        self.sports = sports ?? []
       
        DispatchQueue.main.async {
            self.sportsView.hideIndicator()
            self.sportsView.renderSportsData()
        }
    }
    
    func getSportsIfConnected() {
        apiServices.checkForNetworkConnectivity(getMethod: getSports, stopIndicatorMethod: sportsView.hideIndicator, showAlert: sportsView.showNetworkAlert)
    }

}
