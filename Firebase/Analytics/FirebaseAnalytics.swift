//
//  FirebaseAnalytics.swift
//  HiArt
//
//  Created by Daniel Charry on 11/03/23.
//

import UIKit
import FirebaseAnalytics

struct FirebaseAnalytics { }

struct FirebaseAnalyticsActionTag {
    let viewAppear = "view_appear"
    let pressButton = "press_button"
    let callService = "call_service"
}

struct FirebaseAnalyticsSectionNameTag {
    let onboarding = "onboarding"
    let register = "regiser"
    let profile = "profile"
}

struct FirebaseAnalyticsContentTypeTag {
    let viewController = "viewController"
    let view = "view"
    let button = "button"
    let red = "red"
}

struct FirebaseAnalyticsCustomKey {
    let AnalyticsEventCallService = "service_call"
    let AnalyticsParameterFileName = "file_name"
    let AnalyticsParameterAction = "action"
}

extension FirebaseAnalytics: FirebaseAnalyticsProtocol {

    func tagViewController(_ viewName: String, _ fileName: String, _ action: String) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
            AnalyticsParameterScreenName: viewName,
            AnalyticsParameterContentType: FirebaseAnalyticsContentTypeTag().viewController,
            FirebaseAnalyticsCustomKey().AnalyticsParameterFileName: fileName,
            FirebaseAnalyticsCustomKey().AnalyticsParameterAction: action
        ])
    }

    func tagButton(_ viewName: String, _ elementName: String, _ fileName: String, _ action: String) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterScreenName: viewName,
            AnalyticsParameterContentType: FirebaseAnalyticsContentTypeTag().button,
            AnalyticsParameterItemName: elementName,
            FirebaseAnalyticsCustomKey().AnalyticsParameterFileName: fileName,
            FirebaseAnalyticsCustomKey().AnalyticsParameterAction: action
        ])
    }

    func tagService(_ viewName: String, _ serviceName: String, _ fileName: String, _ action: String) {
        Analytics.logEvent(FirebaseAnalyticsCustomKey().AnalyticsEventCallService, parameters: [
            AnalyticsParameterScreenName: viewName,
            AnalyticsParameterContentType: FirebaseAnalyticsContentTypeTag().red,
            AnalyticsParameterItemName: serviceName,
            FirebaseAnalyticsCustomKey().AnalyticsParameterFileName: fileName,
            FirebaseAnalyticsCustomKey().AnalyticsParameterAction: action
        ])
    }

}
