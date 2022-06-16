//
//  LikeControlView.swift
//  gb_vk_client
//
//  Created by 5vi5t on 23.04.2022.
//

import UIKit

@IBDesignable class LikeControlView: UIView {
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    private var view: UIView!
    
    private var likeCount = 0
    private var isLiked = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func loadFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeControlView", bundle: bundle)
        guard let view = xib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    func setup() {
        self.view = loadFromXib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }
    
    func configure(likesData: Photo) {
        self.likeCount = likesData.likes.likesCount
        countLabel.text = String(self.likeCount)
        if likesData.likes.isLiked == 1 {
            self.isLiked = true
            like()
        } else {
            self.isLiked = false
            dislike()
        }
    }
    
    @IBAction func pressHeartButton(_ sender: Any) {
        if !isLiked {
            self.likeCount += 1
            UIView.transition(with: countLabel,
                              duration: 1,
                              options: .transitionFlipFromRight,
                              animations: { [weak self] in
                                guard let self = self else { return }
                                self.countLabel.text = String(self.likeCount)
                              },
                              completion: nil)
            like()
        } else {
            self.likeCount -= 1
            UIView.transition(with: countLabel,
                              duration: 1,
                              options: .transitionFlipFromLeft,
                              animations: { [weak self] in
                                guard let self = self else { return }
                                self.countLabel.text = String(self.likeCount)
                              },
                              completion: nil)
            dislike()
        }
        countLabel.text = String(self.likeCount)
        isLiked = !isLiked
    }
    
    private func like() {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "heart.fill", withConfiguration: config)
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = .systemRed
        countLabel.textColor = .systemRed
    }
    
    private func dislike() {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "heart", withConfiguration: config)
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = .black
        countLabel.textColor = .black
    }
}
