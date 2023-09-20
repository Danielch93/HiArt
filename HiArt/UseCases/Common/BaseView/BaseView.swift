//
//  BaseView.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

import UIKit
import EasyPeasy

class BaseView: UIView {

    lazy var container: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BaseView: ViewConfigurationProtocol {

    @objc func buildHierarchy() { }

    @objc func setupEvents() { }

    @objc func configureView() {
        backgroundColor = .white
    }

    @objc func setupContrains() {
        container.easy.layout(Edges(0))
    }

}
