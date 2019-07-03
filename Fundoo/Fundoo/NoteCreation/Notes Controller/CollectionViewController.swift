//
//  CollectionViewController.swift
//  Fundoo
//
//  Created by BridgeLabz on 15/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import UserNotifications

fileprivate let searchBarHeight:Int = 50

class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout 
{
    
        lazy var collectionViewFlowLayout : CollectionViewFlowLayout = {
        let layout = CollectionViewFlowLayout(display: .listView)
        return layout
    }()
    
     var listOfNotes:[Notes] = []
    
     var searchFilter:[Notes] = []
    
     var isSearching:Bool = false
    
    var cellcolor:UIColor!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout

        NotificationCenter.default.addObserver(self, selector: #selector(listview(notification:)), name: NSNotification.Name("listgridView"), object: nil)
        
        print("listViewobserver")
        
        registerCellNib()
        
        let searchBar = UISearchBar(frame: CGRect (x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: searchBarHeight))
        view.addSubview(searchBar)
        searchBar.delegate = self


    }
    
    
    func initNotes(){
        print("List initing...")
        listOfNotes = coreFunctions.getAllNotes()
        
        for note in listOfNotes {
            print(note.toString())
        }
    }
    
    @objc func listview(notification : NSNotification){
        let segmentIndex:Int  = notification.userInfo!["segmentIndex"] as! Int
        switch segmentIndex {
        case 0 :
            self.collectionViewFlowLayout.display = .listView
        case 1 :
            self.collectionViewFlowLayout.display = .gridView
        default :
            self.collectionViewFlowLayout.display = .listView
        }
    }
    

    func registerCellNib()
    {
        collectionView.register(UINib.init(nibName: "ListGridView", bundle: nil), forCellWithReuseIdentifier: "noteCollectionCell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if isSearching{
            return searchFilter.count
        }
        return listOfNotes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let note1 = listOfNotes[indexPath.row]
       // let notes2 = searchFilter[indexPath.row]
        let detailCell :CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCollectionCell", for: indexPath) as! CollectionViewCell
        if isSearching {
            
            detailCell.notesDescription.text = searchFilter.description
            detailCell.backgroundColor = UIColor.init(hex: listOfNotes[indexPath.row].color!)

        }
        else {
            
            detailCell.notesTitle.text = note1.title
            detailCell.notesDescription.text = note1.description
            detailCell.backgroundColor = UIColor.init(hex: listOfNotes[indexPath.row].color!)
        }
        
        
        return detailCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell:CollectionViewCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "editVC") as! EditViewController
        if isSearching{
        self.navigationController?.pushViewController(viewController: editVC, animated: true, completion: ({
            editVC.editText.text! = cell.notesTitle.text!
            editVC.editDesc.text! = cell.notesDescription.text!
            editVC.indexpath = indexPath
            editVC.isEditable = true
        }))
        }
        else {
            self.navigationController?.pushViewController(viewController: editVC, animated: true, completion: ({
                editVC.editText.text! = cell.notesTitle.text!
                editVC.editDesc.text! = cell.notesDescription.text!
                editVC.indexpath = indexPath
                editVC.isEditable = true
    }))
    
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let item = coreFunctions.listOfNotes.remove(at: sourceIndexPath.item)
        coreFunctions.listOfNotes.insert(item, at: destinationIndexPath.item)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        initNotes()
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return (CGSize(width: view.bounds.width, height: CGFloat(searchBarHeight)))
    }
    
}
extension UINavigationController
{
    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}


