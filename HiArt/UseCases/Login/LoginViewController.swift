//
//  LoginViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 23/03/23.
//

import UIKit

class LoginViewController: BaseViewController {

    private lazy var _view = LoginView()
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }

    override func loadView() {
        view = _view
    }

}

extension LoginViewController {

    func setupDelegates() {
        _view.delegate = self
    }

}

extension LoginViewController: LoginViewControllerProtocol {

    func goToRegisterUser() {
        coordinator?.showRegister()
    }

    func goToProfile() {
        coordinator?.showProfile()
    }

}
