//
//  ProfileCoordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 7/04/24.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    weak var parentCoordinator: LoginCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewcontroller = ProfileViewController()
        viewcontroller.coordinator = self
        navigationController.pushViewController(viewcontroller, animated: false)
    }
    
    func didFinish() {
        guard let parentCoordinator = parentCoordinator else { return }
        childDidFinish(remove: self, to: parentCoordinator)
    }

}
