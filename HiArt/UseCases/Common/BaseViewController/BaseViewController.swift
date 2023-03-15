//
//  BaseViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

import UIKit

class BaseViewController: UIViewController {

    private var _delegate: FirebaseAnalyticsProtocol!
    public let sectionNameTag = FirebaseAnalyticsSectionNameTag()
    public let actionTag = FirebaseAnalyticsActionTag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupTagDelegates()
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
