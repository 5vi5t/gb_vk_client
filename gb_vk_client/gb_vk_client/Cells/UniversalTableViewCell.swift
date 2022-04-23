//
//  UniversalTableViewCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.03.2022.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
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
        descriptionLabel.text = friend.surname
    }
    
    func configure(group: Group) {
        avatarImageView.image = UIImage(named: group.avatar)
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }
    
    func configureSubviews() {
        layoutIfNeeded()
        self.shadowView.layer.cornerRadius = shadowView.frame.height / 2
        self.shadowView.layer.shadowRadius = 10
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowOpacity = 0.7
        
        self.avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
}
