//
//  FriendsController+TableViewDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

extension FriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell() }
        
        cell.configure(friend: friendsArray[indexPath.row]) { [weak self] in
            self?.performSegue(withIdentifier: SegueFromMyFriendsToGallery, sender: self?.friendsArray[indexPath.row])
        }
        cell.configureSubviews()
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var result = [String]()
        for index in 0..<friendsArray.count {
            if let firstCharOfName = friendsArray[index].name.first {
                result.append(String(firstCharOfName))
            }
        }
        return result
    }
}
