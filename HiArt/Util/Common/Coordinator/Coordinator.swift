//
//  Coordinator.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func didFinish()
    func childDidFinish(remove child: Coordinator, to parent: Coordinator)
}

extension Coordinator {

    func didFinish() {}
    
    func childDidFinish(remove child: Coordinator, to parent: Coordinator) {
        for (index, coordinator) in parent.childCoordinators.enumerated()
        where coordinator === child {
            parent.childCoordinators.remove(at: index)
            break
        }
    }
}
