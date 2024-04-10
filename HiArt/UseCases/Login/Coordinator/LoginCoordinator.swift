//
//  LoginCoordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 7/04/24.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewcontroller = LoginViewController()
        viewcontroller.coordinator = self
        navigationController.pushViewController(viewcontroller, animated: false)
    }
    
}

extension LoginCoordinator {
    
    func showProfile() {
        let child = ProfileCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}
