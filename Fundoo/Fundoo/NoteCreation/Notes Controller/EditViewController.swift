//
//  EditViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 18/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import UserNotifications



class EditViewController: UIViewController{

    
    @IBOutlet weak var editText: UITextField!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var editDesc: UITextField!
    
    var color:String = "FFFFFF"
    
    var reminder:Date?
    
    var colorData:[UIColor] = [#colorLiteral(red: 0.831372549, green: 0.1333333333, blue: 0.9411764706, alpha: 1) , #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) , #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1) , #colorLiteral(red: 0.05098039216, green: 0.8196078431, blue: 0.05490196078, alpha: 1) , #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) , #colorLiteral(red: 1, green: 0.03529411765, blue: 0.2901960784, alpha: 1) , #colorLiteral(red: 0.5568627451, green: 0.6196078431, blue: 0.968627451, alpha: 1)]

    var indexpath:IndexPath?
    
    var  isEditable:Bool = false
    
    var isPinned:Bool = false
    
    var isArchive:Bool = false
    
    var noteid:Int?
    
    let current = Calendar.current
    
    
    private var datePicker:UIDatePicker?
    
    @IBOutlet weak var dateTextFeild: UITextField!
    
    @IBAction func registerNotification(_ sender: Any) {
        requestAuthorization()
        
    }
    
    @IBAction func sheduleNotification(_ sender: UIButton) {
        //setUpDatePicker()
        registerNotification(date: datePicker!.date)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        colorCollectionView.reloadData()
        
    }
    
    @IBAction func onPinnedTapped(_ sender: UIButton) {
        isPinned = !isPinned
        print(isPinned)
    }


    @IBAction func onArchiveTapped(_ sender: UIButton) {
        isArchive = !isArchive
        print(isArchive)
    }
    
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EditViewController.viewTapped(gesture:)))
        view.addGestureRecognizer(tapGesture)
    }

    private func setUpDatePicker () {
        
        requestAuthorization()
        
        datePicker = UIDatePicker()
        
        datePicker?.datePickerMode = .dateAndTime
        
        dateTextFeild.inputView = datePicker
        print(datePicker!.date)
        
        datePicker?.addTarget(self, action: #selector(EditViewController.dateChanged(datePicker:)), for: .valueChanged)

        registerNotification(date: datePicker!.date)
    }
    
    let center = UNUserNotificationCenter.current()
    private func requestAuthorization() {
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("permission granted")
            } else {
                print("permission not granted")
            }
            
            guard let error = error  else { return }
            print(error.localizedDescription)
        }
    }
    
    private func registerNotification(date: Date) {
        let center = UNUserNotificationCenter.current()
//        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Do you want the system to send notification"
        content.categoryIdentifier = "alarm"
        content.sound = .default
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            
            guard let error = error else { return }
            print(error.localizedDescription)
            
        }
    }
        
   
    
    @objc func dateChanged(datePicker:UIDatePicker){
        
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "dd-MM-yyyy hh : mm: ss a"
//        dateFormate.dateStyle = .medium
//        dateFormate.timeZone = NSTimeZone.local
        dateTextFeild.text = dateFormate.string(from: datePicker.date)
        view.endEditing(true)
        print(dateFormate.string(from: datePicker.date))
        
    }
    
    @objc func viewTapped(gesture:UITapGestureRecognizer){
        view.endEditing(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpDatePicker()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("back")
        reminder = Date()
        guard let noteTitle = editText.text,let noteDescription = editDesc.text else { return }
        var noteDetails = Notes.init(title: noteTitle, Description: noteDescription, Color: color, Reminder: reminder!, isPin: isPinned , Archive: isArchive )
        if isEditable {
            noteDetails.updatenotes(notesid: noteDetails.noteid!)
            coreFunctions.update(note: noteDetails)

        }
        else {
            coreFunctions.getDataFromTextFields(note: noteDetails)

        }
        }
}



extension EditViewController:  UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colorCell:CollectionColorViewCell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "colorVc", for: indexPath) as! CollectionColorViewCell
        colorCell.backgroundColor = colorData[indexPath.row]
    return colorCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print("setting background color")
        switch indexPath.row {
                case Indexcolor.pink.rawValue:
                    color = enumcolors.pink.rawValue
                case Indexcolor.green.rawValue:
                    color = enumcolors.green.rawValue
                case Indexcolor.skyBlue.rawValue:
                    color = enumcolors.skyBlue.rawValue
                case Indexcolor.yellow.rawValue:
                    color = enumcolors.yellow.rawValue
                case Indexcolor.lightGreen.rawValue:
                    color = enumcolors.lightGreen.rawValue
                case Indexcolor.hash.rawValue:
                    color = enumcolors.hash.rawValue
        case Indexcolor.red.rawValue:
            color = enumcolors.red.rawValue
        case Indexcolor.violet.rawValue:
            color = enumcolors.violet.rawValue
            
            
                default:color = enumcolors.defaultvalue.rawValue
            
                }
                view.backgroundColor = UIColor.init(hex: color)
                print("background")
            }
    }

extension EditViewController{
    
enum enumcolors:String {
    case defaultvalue = "FFFFFF"
    case pink = "D422F0"
    case green = "579F2B"
    case skyBlue = "42C1F7"
    case yellow = "F5B433"
    case lightGreen = "0DD10E"
    case hash = "999999"
    case red = "FF094A"
    case violet = "8E9EF7"

    
}

enum Indexcolor:Int {
    case pink = 0
    case green = 1
    case skyBlue = 2
    case yellow = 3
    case lightGreen = 4
    case hash = 5
    case red = 6
    case violet = 7
}
}
