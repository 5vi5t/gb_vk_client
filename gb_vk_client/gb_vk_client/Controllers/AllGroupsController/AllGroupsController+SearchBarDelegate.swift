//
//  AllGroupsController+SearchBarDelegate.swift
//  gb_vk_client
//
//  Created by 5vi5t on 09.06.2022.
//

import UIKit

extension AllGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        vkService.searchVkGroups(searchText: searchText) { [weak self] groups in
            guard let self = self else { return }
            self.allGroupsArray = groups
            self.tableView.reloadData()
        }
        if searchText.isEmpty {
            allGroupsArray = []
        } else {
            allGroupsArray = allGroupsArray.filter({ sourceGroup in
                sourceGroup.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
