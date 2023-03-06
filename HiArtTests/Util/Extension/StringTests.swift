//
//  StringTests.swift
//  HiArtTests
//
//  Created by Daniel Charry on 22/11/22.
//

import XCTest
@testable import HiArt

class StringTests: XCTestCase {
    
    let creator = "Daniel"
    let language = NSLocale.preferredLanguages
    let appName = NSLocalizedString("APP_NAME", comment: "")
    
    func testLocalized() {
        XCTAssertEqual(appName, "APP_NAME".localized())
    }
    
    func testLocalizedWithParam() {
        let appCreator = String(format: "APP_CREATOR".localized(), creator)
        XCTAssertEqual(appCreator, "APP_CREATOR".localized(creator))
    }
    
    func testLocalizedWithParams() {
        let appVersion = String(format: "APP_LANGUAGE".localized(), arguments: language)
        XCTAssertEqual(appVersion, "APP_LANGUAGE".localized(language))
    }
    
}
