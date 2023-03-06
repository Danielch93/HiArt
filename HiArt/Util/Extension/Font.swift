//
//  Font.swift
//  HiArt
//
//  Created by Daniel Charry on 15/12/22.
//

import UIKit

extension UIFont {

    func styleBold() -> UIFont {
        return UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.body))
    }

    func styleNormal() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat(Int.Font.body))
    }

    func styleTitle() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat(Int.Font.title))
    }

    func styleBoldTitle() -> UIFont {
        return UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.title))
    }

    func styleSubTitle() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat(Int.Font.subTitle))
    }

    func styleBoldSubTitle() -> UIFont {
        return UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.subTitle))
    }

}

extension NSMutableAttributedString {

    /* This file may not be necessary for the future. */
    var fontSize: CGFloat { return CGFloat(Int.Font.body) }
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont: UIFont { return UIFont.systemFont(ofSize: fontSize) }

    func bold(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        self.append(NSAttributedString(string: text, attributes: attributes))
        return self
    }

    func normal(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: normalFont]
        self.append(NSAttributedString(string: text, attributes: attributes))
        return self
    }

}
