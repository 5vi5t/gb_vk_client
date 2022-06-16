//
//  GalleryCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit
import Kingfisher

class GalleryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var likeCounterView: LikeControlView!
    
    override func prepareForReuse() {
        fotoImageView.image = nil
    }
    
    func configure(fotoData: Photo) {
        for size in fotoData.sizes {
            if size.type == "z" {
                let imageUrl = URL(string: size.url)
                fotoImageView.kf.setImage(with: imageUrl)
            }
        }
        likeCounterView.configure(likesData: fotoData)
    }
}




