//
//  AllGroupsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit
import FirebaseDatabase

class AllGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let ref = Database.database().reference()
    
    var allGroupsArray = [Group]()
    
    let groupsApi = GroupsAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
    
    func addSelectedGroupToFirebaseDB(group: Group) {
        let groupsConteinerRef = ref.child(Session.shared.userId).child(String(group.id))
        groupsConteinerRef.setValue(group.toAnyObject())
    }
}
