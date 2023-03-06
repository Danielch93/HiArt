//
//  Label.swift
//  HiArt
//
//  Created by Daniel Charry on 15/12/22.
//

import UIKit

extension UILabel {

    func boldText(_ text: String) {
        self.font = UIFont().styleBold()
        self.text = text
    }

    func normalText(_ text: String) {
        self.font = UIFont().styleNormal()
        self.text = text
    }

    func titleText(_ text: String, bold: Bool = false) {
        self.font = bold ?
            UIFont().styleBoldTitle() :
            UIFont().styleTitle()
        self.text = text
    }

    func subTitle(_ text: String, bold: Bool = false) {
        self.font = bold
            ? UIFont().styleBoldSubTitle() :
            UIFont().styleSubTitle()
        self.text = text
    }

}
