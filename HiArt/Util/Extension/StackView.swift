//
//  StackView.swift
//  HiArt
//
//  Created by Daniel Charry on 3/03/22.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }

}
