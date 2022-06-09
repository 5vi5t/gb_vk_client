//
//  CustomNavigationController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 31.05.2022.
//

import UIKit

class CustomNavigationController: UINavigationController {

    let interactiveTransition = CustomInteractiveTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            interactiveTransition.viewController = toVC
            return CustomPushAnimator()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return CustomPopAnimator()
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.isAnimationStarted ? interactiveTransition : nil
    }
}
