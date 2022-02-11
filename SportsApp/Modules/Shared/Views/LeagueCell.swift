//
//  LeagueCell.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {
    
    var url: String! = "www.youtube.com/user/FederacioAndFutbol"
    var showAlert : (() -> ()) = {}

    @IBOutlet weak var badge: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //badge.layer.masksToBounds = true
        badge.layer.borderWidth = 1
        badge.layer.borderColor = UIColor.gray.cgColor
        badge.layer.cornerRadius = badge.frame.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func gotoYoutube(_ sender: UIButton) {
        if(url == ""){
            showAlert()
        }
        else if UIApplication.shared.canOpenURL(NSURL(string: url)! as URL) {
            UIApplication.shared.open(NSURL(string: url)! as URL)
        }
        else if UIApplication.shared.canOpenURL(NSURL(string: "https://\(url!)")! as URL) {
            UIApplication.shared.open(NSURL(string: "https://\(url!)")! as URL)
        }
        
    }
}
