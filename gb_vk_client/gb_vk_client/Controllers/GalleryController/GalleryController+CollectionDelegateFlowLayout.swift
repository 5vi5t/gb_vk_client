//
//  GalleryController+CollectionDelegateFlowLayout.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

extension GalleryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightLikeControlView: CGFloat = 50
        
        let width = collectionView.bounds.width / 3 - 30
        return CGSize(width: width, height: width + heightLikeControlView)
    }
}
