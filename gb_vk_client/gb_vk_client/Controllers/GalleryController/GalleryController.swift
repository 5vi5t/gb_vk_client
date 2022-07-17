//
//  GalleryController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

class GalleryController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var fotoArray = [Photo]()
  var id = Int()
  
  let photosApi = PhotosAPI()
  let photosDB = PhotosDB()
  
  override func viewDidLoad() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierGalleryCell)
    photosApi.loadVkPhotos(userId: String(id)) { [weak self] fotos in
      guard let self = self else { return }
      self.photosDB.save(fotos)
      self.fotoArray = self.photosDB.fetch(id: self.id)
      self.collectionView.reloadData()
    }
  }
}

