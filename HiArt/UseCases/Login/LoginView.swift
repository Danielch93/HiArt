//
//  LoginView.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit
import EasyPeasy

class LoginView: BaseView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to login 🔐"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login!",
                        for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    lazy var floatButton: UIButton = {
        let button = UIButton()
        button.setTitle("🎈",
                        for: .normal)
        button.backgroundColor = .yellow
        return button
    }()

    @objc func pressButton() {
        setupContrains()
    }

    @objc func pressFloatButton() {
        print("pressFloatButton!")
        floatButton.easy.clear()
        floatButton.easy.layout(
            Center(0.0),
            Top(20.0).to(containerView)
        )
    }
}

extension LoginView {
    override func buildHierarchy() {
        super.buildHierarchy()
        containerView.addArrangedSubviews(
            [titleLabel, loginButton]
        )
        addSubViews([
            containerView,
            floatButton
        ])
    }

    override func setupContrains() {
        containerView.easy.layout(
            Center(0.0)
        )
        loginButton.easy.layout(Height(50))
        floatButton.easy.layout(
            Leading(0),
            Top(0),
            Size(CGSize(width: 160.0,
                        height: 50.0))
        )
    }

    override func configureView() {
        super.configureView()
    }

    override func setupEvents() {
        loginButton.addTarget(self,
                              action: #selector(pressButton),
                              for: .touchUpInside)
        floatButton.addTarget(self,
                              action: #selector(pressFloatButton),
                              for: .touchUpInside)
    }
}
