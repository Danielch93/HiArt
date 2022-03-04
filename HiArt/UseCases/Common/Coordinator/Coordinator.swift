//
//  Coordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
