//
//  FriendsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friendsArray = [User]()
    var searchFriendsArray = [User]()
    let friendsApi = FriendsAPI()
    let friendsDB = FriendsDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        searchBar.delegate = self
        print(Session.shared.token, Session.shared.userId)
        friendsApi.loadVkFriends { [weak self] friends in
            guard let self = self else { return }
            self.friendsDB.save(friends)
            self.friendsArray = self.friendsDB.fetch()
            self.searchFriendsArray = self.friendsArray
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}

