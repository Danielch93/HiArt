//
//  LoginView.swift
//  HiArt
//
//  Created by Daniel Charry on 23/03/23.
//

import UIKit
import EasyPeasy

class LoginView: BaseView {

    var delegate: LoginViewControllerProtocol!

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.titleText("Login", bold: true)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.subTitle("Login to your account")
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var headersView: UIView = {
        let view = UIView()
        view.addSubViews([titleLabel,
                        subTitleLabel])
        return view
    }()

    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "✉️"
        view.addSubview(label)
        textField.leftView = view
        textField.leftViewMode = .always
        textField.keyboardType = .alphabet
        textField.returnKeyType = .done
        textField.placeholder = "RG_FORM_EMAIL".localized()
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "🔒"
        view.addSubview(label)
        textField.leftView = view
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.placeholder = "RG_FORM_PASSWORD".localized()
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    lazy var stackviewTextfields: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews([
            emailTextField,
            passwordTextField
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.boldText("Sig In".localized())
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.boldText("Create account".localized())
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var buttonsView: UIView = {
        let view = UIView()
        view.addSubViews([loginButton,
                         registerButton])
        return view
    }()

    @objc func goToRegisterUser() {
        delegate?.goToRegisterUser()
    }

    @objc func goToProfile() {
        delegate?.goToProfile()
    }

}

extension LoginView {

    override func buildHierarchy() {
        super.buildHierarchy()
        container.addArrangedSubviews([
            headersView,
            stackviewTextfields,
            buttonsView
        ])
        addSubview(container)
    }

    override func setupContrains() {
        super.setupContrains()

        titleLabel.easy.layout(
            Top(0),
            Height(50),
            Leading(30),
            Trailing(30),
            Bottom(0).to(subTitleLabel)
        )

        subTitleLabel.easy.layout(
            Top(0).to(titleLabel),
            Height(50),
            Leading(30),
            Trailing(30),
            Bottom(0).to(headersView)
        )

        headersView.easy.layout(
            Height(80),
            Bottom(20).to(stackviewTextfields)
        )

        stackviewTextfields.easy.layout(
            Height(130),
            Leading(30),
            Trailing(30)
        )

        buttonsView.easy.layout(
            Top(0).to(stackviewTextfields),
            Leading(30),
            Trailing(30)
        )

        loginButton.easy.layout(
            Height(40),
            Width().like(buttonsView),
            Top(25).to(stackviewTextfields)
        )

        registerButton.easy.layout(
            Height(40),
            Width().like(buttonsView),
            Top(10).to(loginButton)
        )
    }

    override func configureView() {
        super.configureView()
        container.distribution = .fill
    }

    override func setupEvents() {
        super.setupEvents()
        registerButton.addTarget(self, action: #selector(goToRegisterUser), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
    }

}
