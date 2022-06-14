//
//  FriendsController+SearchBarDelegate.swift
//  gb_vk_client
//
//  Created by 5vi5t on 26.04.2022.
//

import UIKit

extension FriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            friendsArray = searchFriendsArray
        } else {
            friendsArray = searchFriendsArray.filter({ searchFriend in
                searchFriend.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
