//
//  ColorFile.swift
//  Fundoo
//
//  Created by BridgeLabz on 22/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit
import Swift
//
//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b : CGFloat
//
//         print("going to create color")
//
//            let start = hex.startIndex
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 6 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
//                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
//                    b = CGFloat((hexNumber & 0x0000ff)) / 255
//              //    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: 1.0)
//
//                    print("created color")
//
//                    return
//                }
//            }
//        return nil
//    }
//}
//
//  UIColorToHex.swift
//  Fundo
//
//  Created by BridgeLabz Solutions LLP  on 6/20/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1.0
        )
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"%02X%02X%02X", rgb)
    }
}
