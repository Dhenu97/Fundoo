//
//  RegisterViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 03/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    var function = UserCoreDataOperator()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet var nametxt: UITextField!
    
    @IBOutlet var emailtxt: UITextField!
    
    @IBOutlet var passwrdtxt: UITextField!
    
    @IBOutlet var reenterpasswrd: UITextField!
    
    
    @IBAction func registerbtn(_ sender: Any) {
        if nametxt.text == "" || emailtxt.text == "" || passwrdtxt.text == "" || reenterpasswrd.text == ""
        {
            let alert = UIAlertController(title: "Information", message: "Its Mandatort to enter all the fields", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "ok" , style: .default, handler: nil )
            
            let cancel = UIAlertAction(title: "cancel" , style: .cancel, handler: nil)
            
            alert.addAction(ok)
            
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        else if (passwrdtxt.text != reenterpasswrd.text)
        {
           let alert = UIAlertController(title: "Information", message: "Enter the correct password", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            alert.addAction(ok)
            
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
    
        }
        //else if function.isemailvalid(emailId: emailtxt.text!) &&  //function.passwordvalidate(password: passwrdtxt.text!){
        //    print("valid")
        
      //  }
            
            
        else
        {
        func coredata(){
                
            let app = UIApplication.shared.delegate as! AppDelegate
            
            let context = app.persistentContainer.viewContext
            
            let new_user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            new_user.setValue(nametxt.text, forKey: "username")
            
            new_user.setValue(emailtxt.text, forKey: "userEmail")
            
            new_user.setValue(passwrdtxt.text, forKey: "userpassword")
            
            do
            {
                try context.save()
                print("Registered  Sucessfully")
            }
            catch
            {
                let Fetcherror = error as NSError
                print("error", Fetcherror.localizedDescription)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    }
}



