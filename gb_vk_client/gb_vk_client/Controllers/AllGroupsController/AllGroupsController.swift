//
//  AllGroupsController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

class AllGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allGroupsArray = Storage.shared.allGroupsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
    }
}
