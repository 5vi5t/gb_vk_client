//
//  HeaderNewsfeedCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.07.2022.
//

import UIKit

class HeaderNewsfeedCell: UITableViewCell {


  @IBOutlet weak var avatarView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    avatarView.image = nil
    nameLabel.text = nil
    dateLabel.text = nil
  }
}

extension HeaderNewsfeedCell: NewsfeedCellProtocol {
  func configure<T: NewsfeedCellDataProtocol>(value: T) {
    let imageLoaderHelper = ImageLoaderHelper()
    
    imageLoaderHelper.loadImage(url: value.image) { [weak self] image in
      self?.avatarView.image = image
    }
    nameLabel.text = value.name
    dateLabel.text = value.date
  }
  
  
}
