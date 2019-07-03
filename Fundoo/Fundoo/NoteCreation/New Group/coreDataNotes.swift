//
//  coreDataNotes.swift
//  Fundoo
//
//  Created by BridgeLabz on 11/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import CoreData
import Swift
import UIKit
class coreFunctions {
    static var arrnote : [NSManagedObject] = []
    
    static var listOfNotes:[Notes]=[]

    
    static var appdel:AppDelegate!
    static var entityDescription:NSEntityDescription?
    static var mobj:NSManagedObjectContext?
    
    
    
    private static func initContext() {
        coreFunctions.appdel=UIApplication.shared.delegate as? AppDelegate
        coreFunctions.mobj=coreFunctions.appdel.persistentContainer.viewContext
        
    }
    
    static func getDataFromTextFields(note: Notes)
    {
        initContext()
        entityDescription=NSEntityDescription.entity(forEntityName:"Note", in: mobj!)
        
        let notes = NSManagedObject(entity: entityDescription!, insertInto: mobj)
        notes.setValue(note.title, forKey: "userTitle")
        
        notes.setValue(note.description, forKey:"userDescription")
        
        notes.setValue(note.color, forKey:"userColor")
        
        notes.setValue(note.reminder, forKey: "userRemainder")
        
        notes.setValue(note.pin, forKey: "notePin")
        
        notes.setValue(note.archive, forKey: "noteArchive")
        
        notes.setValue(note.noteid, forKey: "noteID")
        
        do{
            try mobj!.save()
            arrnote.append(notes)
            
            print("DONE SAVING TO COREDATA")
        }catch{
            
            print("ERROR SAVING TO COREDATA")
            
        }
       
    }
    static func getAllNotes()->[Notes]
    {
        initContext()
        var listOfNotes:[Notes]=[]
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
        do {
            let listOfDnNotes = try mobj!.fetch(fetchRequest) as! [NSManagedObject]
            for dbNote in listOfDnNotes{
                let noteTitle = dbNote.value(forKey: "userTitle") as! String
                let noteDescription = dbNote.value(forKey: "userDescription") as! String
                let noteColor = dbNote.value(forKey: "userColor") as! String
                let noteReminder = dbNote.value(forKey: "userRemainder") as! Date
                let notepin = dbNote.value(forKey: "notePin") as! Bool
                let noteArchive = dbNote.value(forKey: "noteArchive") as! Bool
                let foundNote = Notes(title: noteTitle, Description: noteDescription, Color: noteColor, Reminder: noteReminder , isPin : notepin , Archive : noteArchive )
                print("printing coredata")
                print(foundNote)
                listOfNotes.append(foundNote)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error)")
        }
        return listOfNotes
    }
    
    
    static func delete()
    {
        initContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do
        {
            try mobj!.execute(batchDeleteRequest)
            print("Deleted all objects from coredata")
            
        } catch
        {
            print("Error deleting all data from coredata")
        }
        
    }
    
    static func update(note: Notes)
    {
        
        
        initContext()
        entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: mobj!)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        fetchRequest.predicate = NSPredicate(format: "noteID == %i ", note.noteid!)
        do{
            var fetchArray = try mobj?.fetch(fetchRequest)
            for i in 0..<fetchArray!.count{
                let noteObj = fetchArray![i] as! NSManagedObject
        noteObj.setValue(note.title, forKey:"userTitle")
        noteObj.setValue(note.description, forKey:"userDescription")
        noteObj.setValue(note.color, forKey: "userColor")
        noteObj.setValue(note.pin, forKey: "notePin")
        do{
            try mobj!.save()
//            arrnote[indexpath.row] = noteObj
//            updateNotes[indexpath.row] = note
            print("Data Updated TO COREDATA")
            
        }catch{
            
            print("ERROR SAVING TO COREDATA")
                }
        }
        }catch{
            print("Error")
        
        }
    }
}



