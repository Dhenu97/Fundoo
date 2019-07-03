//
//  SearchFile.swift
//  Fundoo
//
//  Created by BridgeLabz on 26/06/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

extension CollectionViewController : UISearchBarDelegate{
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true

       
    }
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        isSearching = false
    }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        isSearching = false

    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      
        isSearching = false

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFilter.removeAll()
        let predicateFilter = searchBar.text!
        searchFilter = listOfNotes.filter( {$0.title?.range(of: predicateFilter) != nil})
        searchFilter = listOfNotes.filter( {$0.description?.range(of: predicateFilter) != nil})
        isSearching = (searchFilter.count == 0) ? false:true
        collectionView.reloadData()

    }
}

