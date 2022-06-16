//
//  FotoViewController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 20.03.2022.
//

import UIKit
import Kingfisher

class FotoViewController: UIViewController {
    
    private var fotos = [Photo]()
    private var index = Int()
    private var mainImageView = UIImageView()
    private var sideImageView = UIImageView()
    private var animator = UIViewPropertyAnimator()
    private var isLeft = Bool()
    
    func configure(fotos: [Photo], index: Int) {
        self.fotos = fotos
        self.index = index
        if self.fotos.count - 1 >= self.index {
            for size in fotos[index].sizes {
                if size.type == "z" {
                    let url = URL(string: size.url)
                    mainImageView.kf.setImage(with: url)
                }
            }
            //            mainImageView.image = UIImage(named: self.fotos[self.index])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        mainImageView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        mainImageView.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        mainImageView.isHidden = true
    }
    
    private func initialSetup() {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)
        
        let frame = CGRect(x: 0, y: self.view.bounds.height / 2 - self.view.bounds.width / 2, width: self.view.bounds.width, height: self.view.bounds.width)
        
        mainImageView.frame = frame
        self.view.addSubview(mainImageView)
        sideImageView.frame = frame
        self.view.addSubview(sideImageView)
        self.view.bringSubviewToFront(mainImageView)
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        let translationX = recognizer.translation(in: self.view).x
        if translationX > 0 {
            isLeft = false
        } else {
            isLeft = true
        }
        switch recognizer.state {
        case .began:
            if isLeft {
                if index + 1 <= fotos.count - 1 {
                    for size in self.fotos[self.index + 1].sizes {
                        if size.type == "z" {
                            let url = URL(string: size.url)
                            sideImageView.kf.setImage(with: url)
                        }
                    }
                    
                    //                    sideImageView.image = UIImage(named: fotos[index + 1])
                }
                sideImageView.transform = CGAffineTransform(translationX:  view.bounds.width, y: 0)
            } else {
                if index - 1 >= 0 {
                    for size in self.fotos[self.index - 1].sizes {
                        if size.type == "z" {
                            let url = URL(string: size.url)
                            sideImageView.kf.setImage(with: url)
                        }
                    }
                    //                    sideImageView.image = UIImage(named: fotos[index - 1])
                }
                sideImageView.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
            }
            self.animator = UIViewPropertyAnimator(duration: 1,
                                                   curve: .linear,
                                                   animations: { [weak self] in
                                                    guard let self = self else { return }
                                                    if self.index == 0 && !self.isLeft {
                                                        self.mainImageView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                                                        return
                                                    }
                                                    if self.index == self.fotos.count - 1 && self.isLeft {
                                                        self.mainImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
                                                        return
                                                    }
                                                    if self.isLeft {
                                                        self.mainImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
                                                        self.sideImageView.transform = .identity
                                                    } else {
                                                        self.mainImageView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                                                        self.sideImageView.transform = .identity
                                                    }
                                                   })
            self.animator.pauseAnimation()
        case .changed:
            let fractionComplete = abs(translationX / self.view.bounds.width)
            animator.fractionComplete = fractionComplete
        case .ended:
            let fractionComplete = abs(translationX / self.view.bounds.width)
            if fractionComplete > 0.5 {
                if (index == 0 && !isLeft) || (index == fotos.count - 1 && isLeft) {
                    animator.isReversed = true
                    animator.startAnimation()
                    return
                }
                self.animator.addCompletion { [weak self] _ in
                    guard let self = self else { return }
                    if self.isLeft {
                        self.sideImageView.transform = CGAffineTransform(translationX:  self.view.bounds.width, y: 0)
                        if self.index <= self.fotos.count - 1 {
                            self.index += 1
                        }
                    } else {
                        self.sideImageView.transform = CGAffineTransform(translationX:  -self.view.bounds.width, y: 0)
                        if self.index - 1 >= 0 {
                            self.index -= 1
                        }
                    }
                    self.mainImageView.image = self.sideImageView.image
                    self.mainImageView.transform = .identity
                    self.view.bringSubviewToFront(self.mainImageView)
                }
                self.animator.startAnimation()
            } else {
                self.animator.isReversed = true
                self.animator.startAnimation()
            }
        default:
            return
        }
    }
}
