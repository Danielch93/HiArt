//
//  ViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 13/03/23.
//

import UIKit

extension UIViewController {

    func getViewControllerName() -> String {
        return String(describing: type(of: self))
    }

}
