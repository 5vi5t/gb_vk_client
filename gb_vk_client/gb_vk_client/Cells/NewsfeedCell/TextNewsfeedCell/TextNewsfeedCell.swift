//
//  TextNewsfeedCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.07.2022.
//

import UIKit

class TextNewsfeedCell: UITableViewCell {

  @IBOutlet weak var textNewsLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    textNewsLabel.text = nil
  }
}

extension TextNewsfeedCell: NewsfeedCellProtocol {
  func configure<T: NewsfeedCellDataProtocol>(value: T) {
    textNewsLabel.text = value.text
  }
}
