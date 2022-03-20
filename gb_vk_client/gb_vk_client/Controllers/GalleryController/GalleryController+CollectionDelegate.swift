//
//  GalleryController+CollectionDelegate.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

extension GalleryController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let fotoViewController = FotoViewController()
        fotoViewController.configure(fotoPath: fotoArray[indexPath.item])
        self.navigationController?.pushViewController(fotoViewController, animated: true)
    }
}
