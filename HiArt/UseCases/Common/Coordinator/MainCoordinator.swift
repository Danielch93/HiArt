//
//  MainCoordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = OnboardingViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func showLogin() {
        let viewController = LoginViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}
