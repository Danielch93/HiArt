//
//  View.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

import UIKit

extension UIView {

    func addSubViews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }

}
