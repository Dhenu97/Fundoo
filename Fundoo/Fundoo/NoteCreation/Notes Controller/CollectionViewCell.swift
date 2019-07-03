//
//  CollectionViewCell.swift
//  Fundoo
//
//  Created by BridgeLabz on 15/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var notesTitle: UILabel!
    
    @IBOutlet weak var notesDescription: UILabel!
    
    var colorView:UIColor?
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        return layoutAttributes
        


    }
    
    
}
