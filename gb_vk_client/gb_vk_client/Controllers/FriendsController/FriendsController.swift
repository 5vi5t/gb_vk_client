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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        searchBar.delegate = self
        friendsArray = sourceFriendsArray
    }
}

