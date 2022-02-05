//
//  LeagueCell.swift
//  SportsApp
//
//  Created by Youssef on 2/2/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var badge: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    var url: String! = "www.youtube.com/user/FederacioAndFutbol"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        badge.layer.masksToBounds = false
        badge.layer.cornerRadius = badge.frame.size.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func gotoYoutube(_ sender: UIButton) {
        if(url == ""){
            
        }
        else if UIApplication.shared.canOpenURL(NSURL(string: url)! as URL) {
            UIApplication.shared.open(NSURL(string: url)! as URL)
        }
        else if UIApplication.shared.canOpenURL(NSURL(string: "https://\(url!)")! as URL) {
            UIApplication.shared.open(NSURL(string: "https://\(url!)")! as URL)
        }
        
    }
}
