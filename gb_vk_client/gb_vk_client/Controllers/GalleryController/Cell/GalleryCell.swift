//
//  GalleryCell.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

protocol GalleryCellProtocol: AnyObject {
    func countIncrement(count: Int)
    func countDecrement(count: Int)
    func sourceCount() -> Int
}

class GalleryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var likeCounterView: LikeControlView!
    
    var likeCount = 0
    
    weak var delegate: GalleryCellProtocol?
    
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
        likeCounterView.configure(count: likeCount)
    }
}

extension GalleryCell: LikeControlViewProtocol {
    func countIncrement(count: Int) {
        delegate?.countIncrement(count: count)
        print(count)
    }
    
    func countDecrement(count: Int) {
        delegate?.countDecrement(count: count)
        print(count)
    }
    
//    func sourceCount() -> Int {
//        if let count = delegate?.sourceCount() {
//            self.likeCount = count
//        }
//        return self.likeCount
//    }
}



