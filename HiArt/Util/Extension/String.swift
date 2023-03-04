//
//  String.swift
//  HiArt
//
//  Created by Daniel Charry on 4/03/23.
//

import UIKit

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(_ arg: String) -> String {
        return String(format: self.localized(), arg)
    }

    func localized(_ arg: [String]) -> String {
        return String(format: self.localized(), arguments: arg)
    }

}
