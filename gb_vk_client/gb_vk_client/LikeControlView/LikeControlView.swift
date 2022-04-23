//
//  LikeControlView.swift
//  gb_vk_client
//
//  Created by 5vi5t on 23.04.2022.
//

import UIKit

protocol LikeControlViewProtocol: AnyObject {
    func countIncrement(count: Int)
    func countDecrement(count: Int)
    func sourceCount() -> Int
}

@IBDesignable class LikeControlView: UIView {
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    private var view: UIView!
    
    weak var delegate: LikeControlViewProtocol?
    
    var likeCounter = 0
    var isHeartEmpty = true
    
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
        if let sourceCount = self.delegate?.sourceCount() {
            self.likeCounter = sourceCount
        }
    }
    
    @IBAction func pressHeartButton(_ sender: Any) {
        if isHeartEmpty {
            self.likeCounter += 1
            let config = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: "heart.fill", withConfiguration: config)
            heartButton.setImage(image, for: .normal)
            heartButton.tintColor = .systemRed
            countLabel.textColor = .systemRed
            self.delegate?.countIncrement(count: self.likeCounter)
        } else {
            self.likeCounter -= 1
            let config = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: "heart", withConfiguration: config)
            heartButton.setImage(image, for: .normal)
            heartButton.tintColor = .black
            countLabel.textColor = .black
            self.delegate?.countDecrement(count: self.likeCounter)
        }
        countLabel.text = String(likeCounter)
        isHeartEmpty = !isHeartEmpty
    }
    

}
