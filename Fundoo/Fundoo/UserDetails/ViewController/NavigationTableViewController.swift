//
//  NavigationTableViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 07/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class NavigationTableViewController: UITableViewController{
    
    @IBOutlet var tableviewVc: UITableView!
    
    var arrimg:[UIImage] = [#imageLiteral(resourceName: "Home"),#imageLiteral(resourceName: "Re"),#imageLiteral(resourceName: "archive"),#imageLiteral(resourceName: "settings")]
   var arrnames = ["notes","reminder","Archive","Trash","Settings"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableviewVc.delegate = self
//        tableviewVc.dataSource = self
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return arrnames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:NavigationTableViewCell = tableviewVc.dequeueReusableCell(withIdentifier:"menuCell",for:indexPath) as! NavigationTableViewCell
        cell.namelbl.text = arrnames[indexPath.row]
        //cell.imagelbl.image = arrimg[indexPath.row]
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
         //   let detailcell = self.storyboard?.instantiateInitialViewController() as! MenuViewController
        

            
        }
        else if indexPath.row == 1 {
            
            
        }
        else if indexPath.row == 2 {
            
        }
        else if indexPath.row == 3 {
            
        }
        else if indexPath.row == 4 {
            
        }
        else {
            
        }
        
    }
    
   
}
