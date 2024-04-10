//
//  MainCoordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let viewcontroller = LaunchScreenViewController(duration: 1.5)
        viewcontroller.coordinator = self
        navigationController.pushViewController(viewcontroller, animated: false)
    }
    
}

// MARK: - Flows
extension MainCoordinator {
    
    func showLogin() {
        let child = LoginCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func showHome() {
        print("aqui test")
    }
    func showRegister() { }
    
}

// MARK: - Extension: UINavigationControllerDelegate
extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        
        guard let fromViewController = navigationController
            .transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let lunchViewController = fromViewController as? LaunchScreenViewController {
            guard let fromViewControllerCoordinator = lunchViewController.coordinator else { return }
            childDidFinish(remove: fromViewControllerCoordinator, to: self)
        }
        
        if let loginViewController = fromViewController as? LoginViewController {
            guard let fromViewControllerCoordinator = loginViewController.coordinator else { return }
            childDidFinish(remove: fromViewControllerCoordinator, to: self)
        }
        
    }
    
}
