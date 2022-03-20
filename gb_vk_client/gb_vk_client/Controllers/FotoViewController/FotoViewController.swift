//
//  FotoViewController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit

class FotoViewController: UIViewController {
    
    private var foto = String()
    
    func configure(fotoPath: String) {
        foto = fotoPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.height / 2 - self.view.bounds.width / 2, width: self.view.bounds.width, height: self.view.bounds.width))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: foto)
    }
}
