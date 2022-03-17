//
//  AllGroupsController+TableViewDelegate.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

extension AllGroupsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForUniversalTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(allGroupsArray[indexPath.row])
        NotificationCenter.default.post(name: groupInGroupsPressedNotification, object: allGroupsArray[indexPath.row])
    }
}
