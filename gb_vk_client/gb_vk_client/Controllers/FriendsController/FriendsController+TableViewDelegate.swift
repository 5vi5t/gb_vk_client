//
//  FriendsController+TableViewDelegate.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

extension FriendsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForUniversalTableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueFromMyFriendsToGallery,
           let destinationController = segue.destination as? GalleryController,
           let friend = sender as? User {
            destinationController.id = friend.id
        }
    }
}
