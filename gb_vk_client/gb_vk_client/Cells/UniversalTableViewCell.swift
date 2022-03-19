//
//  UniversalTableViewCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func configure(image: UIImage?, name: String?, description: String?) {
            avatarImageView.image = image
            nameLabel.text = name
            descriptionLabel.text = description
    }
    
    func configure(friend: Friend) {
        avatarImageView.image = UIImage(named: friend.avatar)
        nameLabel.text = friend.name
        descriptionLabel.text = friend.surName
    }
}
