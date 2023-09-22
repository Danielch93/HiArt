//
//  ViewController.swift
//  HiArt
//
//  Created by Daniel Charry on 13/03/23.
//

import UIKit

enum ViewControllerTitle: String, CaseIterable {
    case RegisterViewController =  "VC_REGISTER_TITLE"
    case OnboardingViewController = "VC_ONBOARDING_TITLE"
    case ProfileViewController = "VC_PROFILE_TITLE"
    case LoginViewController = "VC_LOGIN_TITLE"
    case DummyViewController = "VC_DUMMY_TITLE"
}

extension UIViewController {

    func getViewControllerName() -> String {
        return String(describing: type(of: self))
    }

    func getViewControllerTitle() -> String {
        let name = ViewControllerTitle.allCases.filter { vc in
            return String(describing: vc) == getViewControllerName()
        }

        return name.first?.rawValue.localized() ?? ""
    }

}
