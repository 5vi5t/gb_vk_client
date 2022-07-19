//
//  NewsfeedController+TableDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.07.2022.
//

import UIKit

enum NewsfeedCellType: Int {
  case headerNewsfeedCell
  case textNewsfeedCell
  case photoNewsfeedCell
  case footerNewsfeedCell
}

extension NewsfeedController:UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return news.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let currentNewsfeedType = news[section].newsfeedType else { return 0 }
    
    switch currentNewsfeedType {
    case .photo: return 3
    case .text: return 3
    case .textAndPhoto: return 4
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let currentNews = news[indexPath.section]
    
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierHeaderNewsfeedCell) as? HeaderNewsfeedCell else { return UITableViewCell() }
      cell.configure(value: currentNews)
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTextNewsfeedCell) as? HeaderNewsfeedCell else { return UITableViewCell() }
      cell.configure(value: currentNews)
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierFooterNewsfeedCell) as? HeaderNewsfeedCell else { return UITableViewCell() }
      cell.configure(value: currentNews)
      return cell
    default:
      return UITableViewCell()
    }
  }
}
