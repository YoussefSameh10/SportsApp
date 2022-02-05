//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Youssef on 2/5/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import XCTest
@testable import SportsApp

class SportsAppTests: XCTestCase {
    
    let apiService = APIServices()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSportsAPI() throws {
        let ex = expectation(description: "Waiting for sports response")
        apiService.getSports { (sports) in
            XCTAssert(sports!.count > 0, "Sports API Failed")
            ex.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testLeaguesAPI() throws {
        let ex = expectation(description: "Waiting for leagues response")
        apiService.getLeaguesBySport(sportName: "Soccer") { (leagues) in
            XCTAssert(leagues!.count > 0, "Leagues API Failed")
            ex.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testEventsAPI() throws {
        let ex = expectation(description: "Waiting for events response")
        apiService.getEventsByLeague(leagueID: "4617") { (events) in
            XCTAssert(events!.count > 0, "Events API Failed")
            ex.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testTeamsAPI() throws {
        let ex = expectation(description: "Waiting for teams response")
        apiService.getTeamsByLeague(leagueName: "English Premier League") { (teams) in
            XCTAssert(teams!.count > 0, "Teams API Failed")
            ex.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    

}
