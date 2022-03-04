//
//  OnboardingViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class OnboardingViewController: BaseViewController {
    private lazy var _view = OnboardingView()
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.delegate = self
    }

    override func loadView() {
        view = _view
    }
}

extension OnboardingViewController: OnboardingControllerProtocol {
    func goToLogin() {
        coordinator?.showLogin()
    }
}
