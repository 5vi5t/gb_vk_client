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
        if segue.identifier == SegueFromMyFriendsToGallery,
           let destinationController = segue.destination as? GalleryController,
           let friend = sender as? Friend {
            destinationController.fotoArray = friend.fotos
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(friendsArray[indexPath.row].name)
        performSegue(withIdentifier: SegueFromMyFriendsToGallery, sender: friendsArray[indexPath.row])
    }
}
