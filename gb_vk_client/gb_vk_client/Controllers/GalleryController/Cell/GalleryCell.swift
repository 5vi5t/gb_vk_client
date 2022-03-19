//
//  GalleryCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func prepareForReuse() {
        fotoImageView.image = nil
    }
    
    func configure(fotoPath: String) {
        fotoImageView.image = UIImage(named: fotoPath)
    }
}
