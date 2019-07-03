//
//  NavigationViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 08/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit



class MenuViewController: UIViewController  , UICollectionViewDelegateFlowLayout {
    

    var isEditable:Bool = false
    
    var isSearchActive:Bool = false

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func noteBtn(_ sender: Any)
    {
        guard let noteV = self.storyboard?.instantiateViewController(withIdentifier: "editVC") as? EditViewController else { return }
        navigationController?.pushViewController(viewController: noteV, animated: true, completion: ({
            noteV.isEditable = false
        }))
        
    }
    
    @IBAction func checkBoxBtn(_ sender: Any) {
    }
    
    @IBAction func brushBtn(_ sender: Any) {
    }
    
    @IBAction func microPhoneBtn(_ sender: Any) {
    }
    
    @IBAction func galleryBtn(_ sender: Any) {
    }
    
   
    
    @IBAction func sideMenu(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        print("navigation")
    }
    
   
    @IBAction func DropDown(_ sender: Any) {
        print("DropDown request sent")
        NotificationCenter.default.post(name: NSNotification.Name("Dropdown"), object: nil)

    }
    
  
    @IBAction func layoutChange(_ sender: UISegmentedControl) {
        NotificationCenter.default.post(name: NSNotification.Name("listgridView"), object: nil, userInfo: ["segmentIndex":sender.selectedSegmentIndex])
    }
    
   

}


