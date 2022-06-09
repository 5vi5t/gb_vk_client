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
    
    let sourceFriendsArray = Storage.shared.friendsArray
    var friendsArray = [Friend]()
    let vkService = VkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        searchBar.delegate = self
        friendsArray = sourceFriendsArray
//        self.navigationController?.delegate = self
        print(Session.shared.token, Session.shared.userId)
        vkService.loadVkFriends()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tableView.isHidden = false
//        searchBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        tableView.isHidden = true
//        searchBar.isHidden = true
    }
    
}

