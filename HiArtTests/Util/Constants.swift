//
//  Constants.swift
//  HiArtTests
//
//  Created by Daniel Charry on 15/12/22.
//

import XCTest
@testable import HiArt

class ConstantsTests: XCTestCase {

    let title = 34
    let subTitle = 22
    let body = 17

    func testFontSizeTitle() {
        XCTAssertEqual(self.title, Int.Font.title)
    }

    func testFontSizeBody() {
        XCTAssertEqual(self.body, Int.Font.body)
    }

    func testFontSizeSubTitle() {
        XCTAssertEqual(self.subTitle, Int.Font.subTitle)
    }

}
