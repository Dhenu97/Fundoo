//
//  CollectionColorViewCell.swift
//  Fundoo
//
//  Created by BridgeLabz on 22/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class CollectionColorViewCell: UICollectionViewCell {
    
}


//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return colorData.count
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let colorCell:CollectionColorViewCell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "colorVc", for: indexPath) as! CollectionColorViewCell
//    colorCell.backgroundColor = colorData[indexPath.row]
//    //        print(colorData)
//    
//    return colorCell
//}
//
//// MARK : not selecting cells
//
//func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//    
//    switch indexPath.row {
//        
//    case Indexcolor.green.rawValue:
//        color = enumcolors.green.rawValue
//        print("green")
//    case Indexcolor.blue.rawValue:
//        color = enumcolors.blue.rawValue
//        print("blue")
//    case Indexcolor.indigo.rawValue:
//        color = enumcolors.indigo.rawValue
//    case Indexcolor.rosePink.rawValue:
//        color = enumcolors.rosePink.rawValue
//    case Indexcolor.green2.rawValue:
//        color = enumcolors.green2.rawValue
//    case Indexcolor.yellow.rawValue:
//        color = enumcolors.yellow.rawValue
//    case Indexcolor.brown.rawValue:
//        color = enumcolors.brown.rawValue
//    default:color = enumcolors.defaultvalue.rawValue
//    print(indexPath)
//        
//    }
//    view.backgroundColor = UIColor.init(hex: color)
//    print("background")
//}
//
//
//enum enumcolors:String {
//    case defaultvalue = "FFFFFF"
//    case green = "B7E297"
//    case blue = "42C1F7"
//    case indigo = "E7FFAF"
//    case rosePink = "FF5970"
//    case green2 = "CAFFD4"
//    case yellow = "F5B433"
//    case brown = "B97A19"
//}
//
//enum Indexcolor:Int {
//    case green = 0
//    case blue = 1
//    case indigo = 2
//    case rosePink = 3
//    case green2 = 4
//    case yellow = 5
//    case brown = 6
//}
//
//
