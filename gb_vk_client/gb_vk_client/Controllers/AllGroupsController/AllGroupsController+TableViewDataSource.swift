//
//  AllGroupsController+TableViewDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

extension AllGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(group: allGroupsArray[indexPath.row]) { [weak self] in
            guard let self = self else { return }
            NotificationCenter.default.post(name: groupInGroupsPressedNotification, object: self.allGroupsArray[indexPath.row])
            self.addSelectedGroupToFirebaseDB(group: self.allGroupsArray[indexPath.row])
        }
        cell.configureSubviews()
        
        return cell
    }
}
