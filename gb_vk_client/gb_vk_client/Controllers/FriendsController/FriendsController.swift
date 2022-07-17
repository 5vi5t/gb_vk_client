//
//  FriendsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit
import RealmSwift

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friends: Results<User>?
    var searchFriends: Results<User>?
    let friendsApi = FriendsAPI()
    let friendsDB = FriendsDB()
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        searchBar.delegate = self
        friendsApi.loadVkFriends { [weak self] friends in
            guard let self = self else { return }
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            self.searchFriends = self.friends
            self.updateTableViewFromRealm()
        }
    }
    
    private func updateTableViewFromRealm() {
        guard let friends = friends else { return }
        token = friends.observe { [weak self] changes in
            switch changes {
            case .initial(_):
                self?.tableView.reloadData()
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                self?.tableView.beginUpdates()
                self?.tableView.insertRows(at: insertions.map { index in
                    IndexPath(row: index, section: 0)
                }, with: .automatic)
                self?.tableView.deleteRows(at: deletions.map { index in
                    IndexPath(row: index, section: 0)
                }, with: .automatic)
                self?.tableView.reloadRows(at: modifications.map { index in
                    IndexPath(row: index, section: 0)
                }, with: .automatic)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}

