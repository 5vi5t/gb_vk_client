//
//  GroupsController+TableViewDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

extension GroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: groupsArray[indexPath.row])
        
        return cell
    }
}
