//
//  String.swift
//  HiArt
//
//  Created by Daniel Charry on 18/04/22.
//

import UIKit
import Foundation

extension NSMutableAttributedString {
    var fontSize: CGFloat { return 14 }
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: 18) }
    var normalFont: UIFont { return UIFont.systemFont(ofSize: 18) }

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
