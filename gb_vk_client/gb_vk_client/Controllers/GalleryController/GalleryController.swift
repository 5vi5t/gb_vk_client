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
    
    let vkService = VkService()
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierGalleryCell)
        vkService.loadVkPhotos(userId: String(id)) { [weak self] fotos in
            guard let self = self else { return }
            self.fotoArray = fotos
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        collectionView.isHidden = true
//        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        collectionView.isHidden = false
//        print(#function)
    }
}

