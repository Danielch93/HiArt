//
//  LoginView.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class LoginView: BaseView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to login 🔐"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
}

extension LoginView {
    override func buildHierarchy() {
        containerView.addArrangedSubview(titleLabel)
        addSubview(containerView)
    }

    override func setupContrains() {
        super.setupContrains()
    }

    override func configureView() {
        super.configureView()
    }

}
