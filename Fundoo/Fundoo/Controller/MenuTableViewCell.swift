//
//  MenuTableViewCell.swift
//  Fundoo
//
//  Created by BridgeLabz on 06/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var noteslbl: UILabel!
    
    @IBOutlet var imagelbl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
