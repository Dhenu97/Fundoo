//
//  DashViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 04/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Swift

class DashViewController: UIViewController  {
    
    var isNavigationOpen = false
    
    var isdropDown = false
    
    @IBOutlet var sideMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dropDownConstraint: NSLayoutConstraint!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("Dashboard Loaded")
        NotificationCenter.default.addObserver(self, selector: #selector(navigationOpen), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        print("dropdown loading")
       NotificationCenter.default.addObserver(self, selector: #selector(dropDown), name: NSNotification.Name("Dropdown"), object: nil)
        
        
    }
    
    
    
    @objc func navigationOpen() {
        print("value observed")
        
        if isNavigationOpen {
            print("navigation open")
            isNavigationOpen = false
            sideMenuConstraint.constant = -240
            
        } else {
            isNavigationOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func dropDown(){
        print("drop down response")
        
        if isdropDown {
            isdropDown = false
            dropDownConstraint.constant = -270
            
        } else {
            isdropDown = true
            dropDownConstraint.constant = 20
        }
      //  UIView.animate(withDuration: 0.3) {
        //self.view.layoutIfNeeded()
       // }
    }
    }
    





