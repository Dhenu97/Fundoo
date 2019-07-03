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
    
    var arrimg:[UIImage] = [#imageLiteral(resourceName: "Home"),#imageLiteral(resourceName: "Reminder")]
   var arrnames = ["notes","reminder","Name", "Create new label" , "Archive" , "Trash" , "Settings" ]

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableviewVc.delegate = self
//        tableviewVc.dataSource = self
        tableviewVc.reloadData()
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
        return cell
}
    
   
}
