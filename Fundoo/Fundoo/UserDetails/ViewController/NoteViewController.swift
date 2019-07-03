//
//  NoteViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 10/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Foundation

class NoteViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
  
   @IBOutlet weak var notestitle: UITextField!
    
   @IBOutlet weak var notesdes: UITextField!
    
    @IBOutlet weak var colorView: UICollectionView!
    
    var indexpath:IndexPath?

    
    override func viewWillDisappear(_ animated: Bool) {
        print("back")
    
}
    
    @IBOutlet weak var popupViewReminder: UIView!
    
}

