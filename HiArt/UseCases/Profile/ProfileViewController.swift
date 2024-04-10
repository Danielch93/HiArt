//
//  ProfileViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 26/03/23.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    private lazy var _view = ProfileView()
    weak var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = _view
    }
    
    deinit {
        coordinator?.didFinish()
    }
}
