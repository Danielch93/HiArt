//
//  OnboardingView.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class OnboardingView: BaseView {
    var delegate: OnboardingControllerProtocol!

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi Art 😄"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the onboarding 🙌"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy var goLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to login",
                        for: .normal)
        button.backgroundColor = .purple
        return button
    }()

    @objc func pressButton() {
        delegate?.goToLogin()
    }
}

extension OnboardingView {
    override func buildHierarchy() {
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(descriptionLabel)
        containerView.addArrangedSubview(goLoginButton)
        addSubview(containerView)
    }

    override func setupContrains() {
        super.setupContrains()
    }

    override func configureView() {
        super.configureView()
    }

    override func setupEvents() {
        print("setupEvents")
        goLoginButton.addTarget(self,
                         action: #selector(pressButton),
                         for: .touchUpInside)
    }
}
