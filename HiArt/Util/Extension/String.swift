//
//  String.swift
//  HiArt
//
//  Created by Daniel Charry on 18/04/22.
//

import UIKit
import Foundation

extension NSMutableAttributedString {
    var fontSize: CGFloat { return 18 }
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
