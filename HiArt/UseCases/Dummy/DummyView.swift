//
//  DummyView.swift
//  HiArt
//
//  Created by Daniel Charry on 12/09/23.
//

import UIKit

class DummyView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.titleText("Login", bold: true)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
}
