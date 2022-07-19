//
//  FooterNewsfeedCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.07.2022.
//

import UIKit

class FooterNewsfeedCell: UITableViewCell {

  @IBOutlet weak var likesButton: UIButton!
  @IBOutlet weak var commentsButton: UIButton!
  @IBOutlet weak var repostsButton: UIButton!
  @IBOutlet weak var viewsLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    likesButton.setTitle(nil, for: .normal)
    commentsButton.setTitle(nil, for: .normal)
    repostsButton.setTitle(nil, for: .normal)
    viewsLabel.text = nil
  }
}

extension FooterNewsfeedCell: NewsfeedCellProtocol {
  func configure<T: NewsfeedCellDataProtocol>(value: T) {
    likesButton.setTitle(String(value.likes), for: .normal)
    commentsButton.setTitle(String(value.comments), for: .normal)
    repostsButton.setTitle(String(value.reposts), for: .normal)
    viewsLabel.text = String(value.views)
  }
  
  
}
