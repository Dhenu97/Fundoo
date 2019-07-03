//
//  LoginViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 03/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
    

class LoginViewController: UIViewController {
    
    var data = UserCoreDataOperator()

    override func viewDidLoad() {
        super.viewDidLoad()
      //coreFunctions.delete()
    }
    
    @IBOutlet var emailtxt: UITextField!
    
    @IBOutlet var paswrdstxt: UITextField!
    
    
    @IBAction func signupbtn(_ sender: Any) {
    
        guard let register = self.storyboard?.instantiateViewController(withIdentifier: "register")as? RegisterViewController
            else {
                return
        }
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    
    @IBAction func loginbtn(_ sender: Any) {

        if emailtxt.text == "" && paswrdstxt.text == ""
        {
            let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)
            
//            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            
//            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            self.present(alert, animated: true, completion: nil)
           
        }
        else if data.isemailvalid(emailId: emailtxt.text!) 
            {
                match(username: emailtxt.text!, password: paswrdstxt.text!)
                print("valid")
                
                guard let Navigation = UIStoryboard(name: "NavigationStoryboard", bundle: nil).instantiateViewController(withIdentifier: "Navigation")as? DashViewController else {
                    return
                }
                self.present(Navigation, animated: true, completion: nil)
        }
                else
                {
                    print("invalid")
                }
}

    func match(username:String , password:String)  {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        let predicate = NSPredicate(format: "userEmail = %@", username)
        
        fetchrequest.predicate = predicate
        
        do{
            let result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let login = result.firstObject as! Users
                
                if login.username == emailtxt.text && login.userpassword == paswrdstxt.text
                {
                    print("Login Succesfully")
                }
                else
                {
                    print("Wrong username or password !!!")
                }
            }
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        
    }
    
}
    






