//
//  GalleryCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var likeCounterView: LikeControlView!
    
    var likeCount = 0
    
    override func prepareForReuse() {
        fotoImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeCounterView.delegate = self
    }
    
    func configure(fotoPath: String, likeCount: Int) {
        fotoImageView.image = UIImage(named: fotoPath)
        self.likeCount = likeCount
    }
}

extension GalleryCell: LikeControlViewProtocol {
    func countIncrement(count: Int) {
        print(count)
    }
    
    func countDecrement(count: Int) {
        print(count)
    }
    
    func sourceCount() -> Int {
        return self.likeCount
    }
}



