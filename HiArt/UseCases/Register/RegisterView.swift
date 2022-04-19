//
//  registerView.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit
import EasyPeasy

class RegisterView: BaseView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to HiArt,"
        label.font = UIFont(descriptor: .init(), size: 30.0)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your information to register"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "👤"
        view.addSubview(label)
        textField.leftView = view
        textField.leftViewMode = .always
        textField.keyboardType = .alphabet
        textField.returnKeyType = .done
        textField.placeholder = "Name"
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "✉️"
        view.addSubview(label)
        textField.leftView = view
        textField.leftViewMode = .always
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    lazy var phoneTextField: UITextField = {
        var textField = UITextField()
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        label.text = "📞"
        view.addSubview(label)
        textField.leftView = view
        textField.leftViewMode = .always
        textField.keyboardType = .phonePad
        textField.placeholder = "Phone"
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
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm",
                        for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var viewLabels: UIView = {
        let view = UIView()
        view.addSubViews([titleLabel, subtitleLabel])
        return view
    }()

    lazy var viewTextfields: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews([
            nameTextField,
            emailTextField,
            phoneTextField,
            passwordTextField
        ])
        view.axis = .vertical
        view.spacing = 15
        view.distribution = .fillEqually
        return view
    }()

    lazy var viewButtons: UIView = {
        let view = UIView()
        view.addSubview(registerButton)
        return view
    }()

    @objc func pressButton() {
        print("Press register")
    }
}

extension RegisterView {
    override func buildHierarchy() {
        super.buildHierarchy()
        container.addArrangedSubviews([
            viewLabels,
            viewTextfields,
            viewButtons
        ])

        addSubViews([
            container
        ])
    }

    override func setupContrains() {
        super.setupContrains()

        titleLabel.easy.layout(
            Top(30),
            Leading(30),
            Trailing(40)
        )

        subtitleLabel.easy.layout(
            Top(10).to(titleLabel),
            Leading(30),
            Trailing(40)
        )

        registerButton.easy.layout(
            Height(60),
            Leading(45),
            Trailing(45),
            Bottom(45)
        )

        viewLabels.easy.layout(Height(150))
        viewTextfields.easy.layout(
            Height(280),
            Top(0).to(viewLabels),
            Leading(30),
            Trailing(30)
        )
    }

    override func configureView() {
        super.configureView()
        container.distribution = .fill
    }

    override func setupEvents() {
        registerButton.addTarget(self,
                              action: #selector(pressButton),
                              for: .touchUpInside)
    }
}
