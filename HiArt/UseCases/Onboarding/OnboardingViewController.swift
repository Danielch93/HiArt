//
//  OnboardingViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit

class OnboardingViewController: BaseViewController {

    // MARK: - Variable declaration

    private lazy var _view = OnboardingView()
    var coordinator: MainCoordinator?

    // MARK: - Lyfe Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupPageController()
        setupSteps()
    }

    override func loadView() {
        view = _view
    }

    override func viewDidLayoutSubviews() {
        _view.onboardingScrollView.contentSize =
            CGSize(width: _view.frame.size.width * CGFloat(3),
                   height: _view.onboardingScrollView.frame.size.height)
        setupSteps()
    }
}

extension OnboardingViewController {

    // MARK: - Configuration methods

    func setupDelegates() {
        _view.delegate = self
        _view.onboardingScrollView.delegate = self
    }

    func setupPageController() {
        _view.onboardingPageControl.numberOfPages = 3
        _view.onboardingPageControl.hidesForSinglePage = true
    }

    func setupSteps() {
        for (index, view) in [_view.testView1, _view.testView2, _view.testView3].enumerated() {
            view.frame = CGRect(x: _view.onboardingScrollView.frame.size.width * CGFloat(index),
                                y: 0,
                                width: _view.onboardingScrollView.frame.size.width,
                                height: _view.onboardingScrollView.frame.size.height)
            _view.onboardingScrollView.addSubview(view)
        }
    }

    func configureNextStep() {
        let nextPageContentOffset = _view.onboardingScrollView.contentOffset.x +
            _view.bounds.width + 1

        if nextPageContentOffset <= _view.onboardingScrollView.contentSize.width {
            UIView.animate(withDuration: 0.5) {
                self._view.onboardingScrollView.contentOffset.x = nextPageContentOffset - 1
                self._view.onboardingPageControl.currentPage += 1
            }
        } else {
            coordinator?.showLogin()
        }
    }
}

// MARK: - Extension UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        _view.onboardingPageControl.currentPage = Int(scrollView.contentOffset.x /
                                                        _view.onboardingScrollView.frame.size.width)
    }
}

// MARK: - Extension OnboardingControllerProtocol

extension OnboardingViewController: OnboardingControllerProtocol {
    func goToLogin() {
        coordinator?.showLogin()
    }

    func nextStep() {
        configureNextStep()
    }
}
