//
//  DummyViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 12/09/23.
//

import UIKit

class DummyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        let _view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        _view.backgroundColor = .red
        view = _view
    }
}
