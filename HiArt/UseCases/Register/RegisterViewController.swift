//
//  RegisterViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class RegisterViewController: BaseViewController {

    private lazy var _view = RegisterView()
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tagViewController(sectionName: sectionNameTag.register,
                          fileName: self.getViewControllerName(),
                          action: actionTag.viewAppear)
    }

    override func loadView() {
        view = _view
    }
}

extension RegisterViewController {

    func setupDelegates() {
        _view.delegate = self
        _view.nameTextField.delegate = self
        _view.emailTextField.delegate = self
        _view.phoneTextField.delegate = self
        _view.passwordTextField.delegate = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self._view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        self._view.endEditing(true)
    }

}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self._view.endEditing(true)
        return true
    }

}

extension RegisterViewController: RegisterViewControllerProtocol {
    func registerUser() {
        FirebaseUserManager.createUser()
    }
}
