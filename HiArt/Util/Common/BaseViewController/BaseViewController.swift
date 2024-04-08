//
//  BaseViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

import UIKit

enum NavigateTo {
    case back
    case root
}

class BaseViewController: UIViewController {

    var _delegate: FirebaseAnalyticsDelegate?
    public let sectionNameTag = FirebaseAnalyticsSectionNameTag()
    public let actionTag = FirebaseAnalyticsActionTag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = getViewControllerTitle()
        setupNavbar()
        setupTagDelegates()
        edgesForExtendedLayout = []
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deInit")
    }

    func setupNavbar() {
        let navBar = self.navigationController?.navigationBar
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .systemBlue
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.shadowColor = .clear

        let compactAppearance = standardAppearance.copy()
        compactAppearance.backgroundColor = .systemBlue

        navBar?.tintColor = .white
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance

        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navBar?.compactScrollEdgeAppearance = compactAppearance
        }

        setupButtonsNavbar()
    }

    func setupButtonsNavbar() {
        let navBarItem = self.navigationItem
        if self.navigationController?.viewControllers.count != 1 {
            navBarItem.leftBarButtonItem = addCustomButtonNavigationBar(title: "Back", action: .back)
        }
        navBarItem.rightBarButtonItem = addCustomButtonNavigationBar(title: "Root", action: .root)
    }

    func addCustomButtonNavigationBar(title: String, action: NavigateTo) -> UIBarButtonItem {
        return UIBarButtonItem(title: title,
                               style: .plain,
                               target: self,
                               action: action == .back ? #selector(back) : #selector(rootView))
    }

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func rootView() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

// MARK: - Extension Tag BaseViewController
extension BaseViewController {

    private func setupTagDelegates() {
        _delegate = FirebaseAnalytics()
    }

    func tagViewController(sectionName: String, fileName: String, action: String) {
        _delegate?.tagViewController(sectionName, fileName, action)
    }

    func tagButton(sectionName: String, elementName: String, fileName: String, action: String) {
        _delegate?.tagButton(sectionName, elementName, fileName, action)
    }

    func tagService(sectionName: String, serviceName: String, fileName: String, action: String) {
        _delegate?.tagService(sectionName, serviceName, fileName, action)
    }

}
