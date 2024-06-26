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
    private var _nextPageContentOffset: CGFloat = 0
    var coordinator: MainCoordinator?

    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupPageController()
        setupScrollView()
    }

    override func loadView() {
        view = _view
    }

    override func viewDidLayoutSubviews() {
        setupSteps()
        _view.onboardingScrollView.contentSize =
            CGSize(width: _view.frame.size.width * CGFloat(3),
                   height: _view.onboardingScrollView.frame.size.height)
    }

    override func viewWillAppear(_ animated: Bool) {
        tagViewController(sectionName: sectionNameTag.onboarding,
                          fileName: self.getViewControllerName(),
                          action: actionTag.viewAppear)
    }

}

// MARK: - Extension OnboardingViewController
extension OnboardingViewController {

    // MARK: - Configuration methods
    func setupDelegates() {
        _view.delegate = self
        _view.onboardingScrollView.delegate = self
    }

    func setupScrollView() {
        _view.onboardingScrollView.isPagingEnabled = true
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
        _nextPageContentOffset = _view.onboardingScrollView.contentOffset.x +
            _view.bounds.width + 1

        if _nextPageContentOffset <= _view.onboardingScrollView.contentSize.width {
            UIView.animate(withDuration: 0.5) {
                self._view.onboardingScrollView.contentOffset.x = self._nextPageContentOffset - 1
                self._view.onboardingPageControl.currentPage += 1
            }
        } else {
            self.goToLogin()
        }

        updateTextButton()
    }

    func updateTextButton() {
        // FIXME: Change this when create the "viewmodel" for get number of pages
        let lastViewInDisplay = _view.frame.size.width * 2 ==
            _view.onboardingScrollView.contentOffset.x

        _view.nextStepButton.boldText("OB_PAGE_ONE_BUTTON_FINISH".localized())
        guard lastViewInDisplay else {
            _view.nextStepButton.normalText("OB_PAGE_ONE_BUTTON_NEXT".localized())
            return
        }
    }

}

// MARK: - Extension UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateTextButton()
        _view.onboardingPageControl.currentPage = Int(scrollView.contentOffset.x /
                                                        _view.onboardingScrollView.frame.size.width)
    }
}

// MARK: - Extension OnboardingControllerProtocol
extension OnboardingViewController: OnboardingControllerProtocol {

    func goToLogin() {
        coordinator?.showRegister()
        tagButton(sectionName: sectionNameTag.onboarding,
                  elementName: "OB_PAGE_ONE_BUTTON_FINISH".localized(),
                  fileName: self.getViewControllerName(),
                  action: actionTag.pressButton)
    }

    func nextStep() {
        configureNextStep()
        tagButton(sectionName: sectionNameTag.onboarding,
                  elementName: "OB_PAGE_ONE_BUTTON_NEXT".localized(),
                  fileName: self.getViewControllerName(),
                  action: actionTag.pressButton)
    }

}
