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
    
    var likeCount = 0
    var isLiked = true
    
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
    
    func configure(likeCount: Int) {
        self.likeCount = likeCount
        countLabel.text = String(self.likeCount)
    }
    
    @IBAction func pressHeartButton(_ sender: Any) {
        if isLiked {
            self.likeCount += 1
            UIView.transition(with: countLabel,
                              duration: 1,
                              options: .transitionFlipFromRight,
                              animations: { [weak self] in
                                guard let self = self else { return }
                                self.countLabel.text = String(self.likeCount)
                              },
                              completion: nil)
            let config = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: "heart.fill", withConfiguration: config)
            heartButton.setImage(image, for: .normal)
            heartButton.tintColor = .systemRed
            countLabel.textColor = .systemRed
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
            let config = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: "heart", withConfiguration: config)
            heartButton.setImage(image, for: .normal)
            heartButton.tintColor = .black
            countLabel.textColor = .black
        }
        countLabel.text = String(self.likeCount)
        isLiked = !isLiked
    }
    

}
