//
//  LoginViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class LoginViewController: BaseViewController {
    private lazy var _view = LoginView()
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = _view
    }
}
