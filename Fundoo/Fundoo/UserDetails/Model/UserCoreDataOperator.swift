//
//  CoreDataFunctions.swift
//  Fundoo
//
//  Created by BridgeLabz on 04/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import Swift
import CoreData
import UIKit

class UserCoreDataOperator {
    
    var appDel:AppDelegate!
    var entityDescription:NSEntityDescription!
    var moc:NSManagedObjectContext!
    var Names:String = ""
    var Emails:String = ""
    var Passwords:String = ""

    func getDataFromTextFields(name: String, email: String, password: String)
    {
        entityDescription=NSEntityDescription.entity(forEntityName:"Users", in: moc)
        
        let mngdObj=NSManagedObject(entity: entityDescription, insertInto: moc)
        mngdObj.setValue(name, forKey:"username")
        
        mngdObj.setValue(email, forKey:"userEmail")
        
        mngdObj.setValue(password, forKey:"userpassword")
        
        do{
            try moc.save()
            print("DONE SAVING TO COREDATA")
        }catch{
            
            print("ERROR SAVING TO COREDATA")
            
        }
        
    }
    
    func isemailvalid(emailId:String)->Bool
    {
        let emailRegix = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegix)
        
        return emailTest.evaluate(with:emailId)
    }
    
    
    func passwordvalidate(password: String) -> Bool
    {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: password)
    }
    
    
}

    

