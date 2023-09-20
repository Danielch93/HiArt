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

    func showOnboarding() {
        let viewController = OnboardingViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func showLogin() {
        let viewController = LoginViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func showRegister() {
        let viewController = RegisterViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func showProfile() {
        let viewController = ProfileViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

}
