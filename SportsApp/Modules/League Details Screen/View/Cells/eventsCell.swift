//
//  LeaguesDetailsCollectionViewCell.swift
//  SportsApp
//
//  Created by Amr El Shazly on 04/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class eventsCell: UICollectionViewCell {
    
    @IBOutlet weak var eventRoundLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventResultLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var teamsNameLabel: UILabel!

    
    override func awakeFromNib() {
        //layer.cornerRadius = 70
    }
    
    
}
