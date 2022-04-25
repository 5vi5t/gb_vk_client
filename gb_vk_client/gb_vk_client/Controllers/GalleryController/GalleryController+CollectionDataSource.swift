//
//  GalleryController+CollectionDataSource.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

extension GalleryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGalleryCell, for: indexPath) as? GalleryCell else {
            return UICollectionViewCell()
        }
        cell.configure(fotoPath: fotoArray[indexPath.item], likeCount: 300)
        return cell
    }
}
