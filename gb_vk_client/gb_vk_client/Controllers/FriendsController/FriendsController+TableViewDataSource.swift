//
//  FriendsController+TableViewDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

extension FriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let friends = friends else { return 0 }
        print(friends.count)
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell,
              let friends = friends else { return UITableViewCell() }
        
        cell.configure(friend: friends[indexPath.row]) { [weak self] in
            self?.performSegue(withIdentifier: segueFromMyFriendsToGallery, sender: self?.friends?[indexPath.row])
        }
        cell.configureSubviews()
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var result = [String]()
        if let friends = friends {
            for index in 0..<friends.count {
                if let firstCharOfName = friends[index].name.first {
                    result.append(String(firstCharOfName))
                }
            }
        }
        return result
    }
}
