//
//  GroupsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

class GroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        NotificationCenter.default.addObserver(self, selector: #selector(addGroupFromGroups(_:)), name: groupInGroupsPressedNotification, object: nil)
    }
    
    func isContained(item: String) -> Bool {
        groupsArray.contains { (groupsItem) -> Bool in
            groupsItem == item
        }
    }
    
    
    @objc func addGroupFromGroups(_ notification: Notification) {
        guard let newGroup = notification.object as? String else { return }
        
        if isContained(item: newGroup) {
            print("\(newGroup) is already added")
        } else {
            groupsArray.append(newGroup)
            print("\(newGroup) was appended")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    
}
