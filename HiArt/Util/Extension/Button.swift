//
//  Button.swift
//  HiArt
//
//  Created by Daniel Charry on 15/12/22.
//

import UIKit

extension UIButton {

    func boldText(_ text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont().styleBold()
    }

    func normalText(_ text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont().styleNormal()
    }

}
