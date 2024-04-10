//
//  LaunchScreenViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 7/04/24.
//

import UIKit

final class LaunchScreenViewController: BaseViewController {
    
    private lazy var _view = LaunchScreenView()
    weak var coordinator: MainCoordinator?
    var duration: Double?
    
    init(duration: Double = 3.0) {
        super.init()
        self.duration = duration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animationStart()
    }
    
}

//MARK: - Extension: Animation methods
extension LaunchScreenViewController {
    
    func animationStart() {
        UIView.animate(withDuration: duration ?? 3.0) {
                self._view.titleLabel.frame = CGRect(x: 0, y: 0, width: 700, height: 0)
        } completion: { _ in
            self.animatedDisappearTitle()
        }
    }
    
    func animatedDisappearTitle() {
        
        UIView.transition(with: _view.titleLabel,
                          duration: 0.4,
                          options: .curveEaseOut) {
            self._view.titleLabel.alpha = 0.0
        } completion: { _ in
            self.animatedColorBackground()
        }
        
    }
    
    func animatedColorBackground() {
        UIView.transition(with: view, duration: 0.5) {
            self.view.backgroundColor = .white
        } completion: { _ in
            self.coordinator?.showLogin()
        }
    }
    
}
