//
//  ProfileView.swift
//  HiArt
//
//  Created by Daniel Charry on 26/03/23.
//

import UIKit
import EasyPeasy

class ProfileView: BaseView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.titleText("Profile", bold: true)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var headersView: UIView = {
        let view = UIView()
        view.addSubViews([titleLabel])
        return view
    }()

    lazy var userPhotoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.subTitle("Daniel Charry", bold: true)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.normalText("dacharry93@gmail.com")
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var userInformationView: UIView = {
        let view = UIView()
        view.addSubViews([
            userNameLabel,
            userEmailLabel
        ])
        return view
    }()

    lazy var profileInformationView: UIView = {
        let view = UIView()
        view.addSubViews([
            userPhotoView,
            userInformationView
        ])
        return view
    }()

    lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.boldText("Logout".localized())
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var buttonsView: UIView = {
        let view = UIView()
        view.addSubViews([logOutButton])
        return view
    }()

}

extension ProfileView {

    override func buildHierarchy() {
        super.buildHierarchy()
        container.addArrangedSubviews([
            headersView,
            profileInformationView,
            buttonsView
        ])
        addSubview(container)
    }

    override func setupContrains() {
        super.setupContrains()

        titleLabel.easy.layout(
            Height(100),
            Top(0),
            Leading(30),
            Trailing(30),
            Bottom(0).to(profileInformationView)
        )

        headersView.easy.layout(
            Height(80)
        )

        userPhotoView.easy.layout(
            Top(0),
            Height(100),
            Width(100),
            Leading(0)
        )

        userNameLabel.easy.layout(
            Top(0),
            Bottom(0).to(userEmailLabel)

        )

        userEmailLabel.easy.layout(
            Top(0).to(userNameLabel)
        )

        userInformationView.easy.layout(
            Height(50),
            Leading(15).to(userPhotoView),
            Trailing(0),
            CenterY(0).to(userPhotoView)
        )

        profileInformationView.easy.layout(
            Leading(30),
            Trailing(30)
        )

        logOutButton.easy.layout(
            Top(20).to(buttonsView),
            Height(40),
            Width().like(buttonsView)
        )

        buttonsView.easy.layout(
            Top(0).to(userPhotoView),
            Leading(30),
            Trailing(30)
        )
    }

    override func configureView() {
        super.configureView()
        container.distribution = .fill
    }

    override func setupEvents() {
        super.setupEvents()
    }

}
