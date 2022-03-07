//
//  BaseViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        edgesForExtendedLayout = []
    }

    func setupNavbar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    func addCloseNavigationBar() {
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "╳",
                            style: .plain,
                            target: self,
                            action: #selector(close))
    }

    @objc func close() {
        print("Salir")
    }
}
