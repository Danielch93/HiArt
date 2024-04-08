//
//  LaunchScreenView.swift
//  HiArt
//
//  Created by Daniel Charry on 7/04/24.
//

import UIKit
import Combine

final class LaunchScreenView: BaseView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HiArt"
        label.font = .boldSystemFont(ofSize: 54)
        label.textAlignment = .center
        label.textColor = .hiaBlue
        return label
    }()
    
}

extension LaunchScreenView {
    
    override func buildHierarchy() {
        super.buildHierarchy()
        container.addArrangedSubviews([
            titleLabel
        ])
        addSubview(container)
    }
    
    override func configureView() {
        super.configureView()
        self.backgroundColor = .hiaDarkBlue
    }
}
