//
//  SportsCustomCollectionViewCell.swift
//  SportsApp
//
//  Created by Amr El Shazly on 02/02/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class SportsCustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    
    override func awakeFromNib() {
        layer.cornerRadius = 25
        backgroundColor = .gray
        sportNameLabel.layer.masksToBounds = true
        sportNameLabel.layer.cornerRadius = 25
    }
    
    
}
