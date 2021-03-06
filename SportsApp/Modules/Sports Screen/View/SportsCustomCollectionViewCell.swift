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
    
    @IBOutlet weak var sportsCellView: UIView!
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    
    override func awakeFromNib() {
        sportsCellView.layer.masksToBounds = true
        sportsCellView.layer.cornerRadius = 25
        
    }
    
    
}
