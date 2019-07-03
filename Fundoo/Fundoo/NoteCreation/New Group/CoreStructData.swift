//
//  CoreStructData.swift
//  Fundoo
//
//  Created by BridgeLabz on 21/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation

struct Notes {
    var noteid:Int?
    var title:String?
    var description:String?
    var color:String?
    var reminder:Date?
    var pin:Bool?
    var archive:Bool?
    
    static var Factor = 0
    
    static func getid()->Int{
        self.Factor += 1
        return self.Factor
    }
    
    mutating func updatenotes(notesid : Int){
        self.noteid = notesid
    }
    
    private init(){
        self.noteid = Notes.getid()
        
    }
    
    init(title : String , Description : String , Color : String , Reminder :Date , isPin : Bool , Archive :Bool ) {
        self.init()
        self.title = title
        self.description = Description
        self.color = Color
        self.reminder = Reminder
        self.pin = isPin
        self.archive = Archive
        
    }
   
    
    func toString () -> String {
        return """
        NOte Id : \(noteid!)
        Note Title : \(title!)
        Note description : \(description!)
        Note Color : \(color!)
        Note reminder : \(reminder!)
        Note pin : \(pin!)
        Note archive : \(archive!)
        """
    }
    
    
}
