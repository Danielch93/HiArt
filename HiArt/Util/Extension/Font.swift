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
