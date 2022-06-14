//
//  CustomInteractiveTransition.swift
//  gb_vk_client
//
//  Created by 5vi5t on 01.06.2022.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(onPan(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var isAnimationStarted = false
    var isAnimationFinished = false
    
    @objc func onPan(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            isAnimationStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            print(translation)
            let relativeTranslation = translation.y / (recognizer.view?.bounds.width ?? 1)
            print(relativeTranslation)
            let progress = max(0, min(1, relativeTranslation))
            print(progress)
            isAnimationFinished = progress > 0.33
            self.update(progress)
        case .ended:
            isAnimationStarted = false
            isAnimationFinished ? self.finish() : self.cancel()
        case .cancelled:
            self.isAnimationStarted = false
            self.cancel()
        default:
            return
        }
    }
    
    
    
    
}
