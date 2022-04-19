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
        showOnboarding()
    }

    func showRegister() {
        let viewController = RegisterViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func showOnboarding() {
        let viewController = OnboardingViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}
