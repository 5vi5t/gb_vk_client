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
  
  private let imageLoaderHelper = ImageLoaderHelper()
  
  override func prepareForReuse() {
    fotoImageView.image = nil
  }
  
  func configure(fotoData: Photo) {
    imageLoaderHelper.loadImage(url: fotoData.fotoUrl) { [weak self] image in
      self?.fotoImageView.image = image
    }
    likeCounterView.configure(likesData: fotoData)
  }
}




