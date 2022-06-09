//
//  GroupsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 13.03.2022.
//

import UIKit

class GroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [Group]()
    let vkService = VkService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        NotificationCenter.default.addObserver(self, selector: #selector(addGroupFromGroups(_:)), name: groupInGroupsPressedNotification, object: nil)
        vkService.loadVkGroups(userId: Session.shared.userId)
    }
    
    func isContained(group: Group) -> Bool {
        groupsArray.contains { (groupsItem) -> Bool in
            groupsItem.name == group.name
        }
    }
    
    
    @objc func addGroupFromGroups(_ notification: Notification) {
        guard let newGroup = notification.object as? Group else { return }
        
        if isContained(group: newGroup) {
            print("\(newGroup.name) is already added")
        } else {
            groupsArray.append(newGroup)
            print("\(newGroup.name) was appended")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    
}
