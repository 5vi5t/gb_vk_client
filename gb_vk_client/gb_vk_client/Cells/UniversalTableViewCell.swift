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
    
    private let imageLoaderHelper = ImageLoaderHelper()
    
    var completion: (() -> Void)?
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        completion = nil
    }
    
    func configure(image: UIImage?, name: String?, description: String?) {
        avatarImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
    }
    
    func configure(friend: User, completion: @escaping (() -> Void)) {
        imageLoaderHelper.loadImage(url: friend.avatar) { [weak self] image in
            self?.avatarImageView.image = image
        }
        nameLabel.text = friend.name
        descriptionLabel.text = friend.surname
        self.completion = completion
    }
    
    func configure(group: Group, completion: (() -> Void)? = nil) {
        imageLoaderHelper.loadImage(url: group.avatar) { [weak self] image in
            self?.avatarImageView.image = image
        }
        nameLabel.text = group.name
        descriptionLabel.text = nil
        self.completion = completion
    }
    
    func configureSubviews() {
        layoutIfNeeded()
        self.shadowView.layer.cornerRadius = shadowView.frame.height / 2
        self.shadowView.layer.shadowRadius = 10
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowOpacity = 0.7
        
        self.avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    @IBAction func avatarButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2,
                       animations: { [weak self] in
                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        self?.shadowView.transform = scale
                        self?.avatarImageView.transform = scale
                       },
                       completion: nil)
    }
    
    @IBAction func avatarButtonReleased(_ sender: Any) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [.beginFromCurrentState],
                       animations: { [weak self] in
                        let scale = CGAffineTransform(scaleX: 1, y: 1)
                        self?.shadowView.transform = scale
                        self?.avatarImageView.transform = scale
                       },
                       completion: nil)
    }
    
    @IBAction func cellButtonPressed(_ sender: Any) {
        self.completion?()
    }
    
}
