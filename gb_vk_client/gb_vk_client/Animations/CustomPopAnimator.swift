//
//  CustomPopAnimator.swift
//  gb_vk_client
//
//  Created by 5vi5t on 02.06.2022.
//

import UIKit

class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.setAnchor(point: CGPoint(x: 1, y: 0))
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
        source.view.setAnchor(point: CGPoint(x: 1, y: 0))
        source.view.frame = transitionContext.containerView.frame
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            source.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
            destination.view.transform = .identity
        } completion: { isSuccess in
            if isSuccess && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(isSuccess && !transitionContext.transitionWasCancelled)
        }
    }
}
