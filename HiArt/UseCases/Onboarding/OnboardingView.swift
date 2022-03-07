//
//  OnboardingView.swift
//  HiArt
//
//  Created by Daniel Charry on 28/02/22.
//

import UIKit
import EasyPeasy

class OnboardingView: BaseView {
    var delegate: OnboardingControllerProtocol!

    lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 0
        return view
    }()

    lazy var onboardingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = .clear
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    lazy var onboardingPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()

    lazy var nextStepButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next",
                        for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var testView1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()

    lazy var testView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    lazy var testView3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    lazy var testLabel: UILabel = {
        let label  = UILabel()
        label.text = "Step"
        label.textAlignment = .center
        label.textColor = .systemBlue
        return label
    }()

    @objc func pressButton() {
        delegate?.goToLogin()
    }

    @objc func nextStepOnboarding() {
        delegate?.nextStep()
    }
}

extension OnboardingView {
    override func buildHierarchy() {
        containerView.addArrangedSubviews([
            onboardingScrollView,
            onboardingPageControl
        ])

        container.addArrangedSubviews([
            containerView,
            nextStepButton
        ])

        addSubview(container)
    }

    override func setupContrains() {
        container.easy.layout(
            Center(0),
            Edges(UIEdgeInsets(top: 5,
                               left: 0,
                               bottom: 57,
                               right: 0)))

        onboardingScrollView.easy.layout(
            Height(400)
        )

        onboardingPageControl.easy.layout(
            Height(10)
        )

        testLabel.easy.layout(
            Width(100),
            Center(0)
        )

        nextStepButton.easy.layout(
            Height(54),
            Leading(90),
            Trailing(90)
        )
    }

    override func configureView() {
        super.configureView()
        container.spacing = 50
    }

    override func setupEvents() {
        nextStepButton.addTarget(self,
                                 action: #selector(nextStepOnboarding),
                                 for: .touchUpInside)
    }
}
