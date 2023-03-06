//
//  FontTests.swift
//  HiArtTests
//
//  Created by Daniel Charry on 15/12/22.
//

import XCTest
@testable import HiArt

class FontTests: XCTestCase {

    func testFontBold() {
        let fontBold = UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.body))
        XCTAssertEqual(fontBold, UIFont().styleBold())
    }

    func testFontNormal() {
        let fontNormal = UIFont.systemFont(ofSize: CGFloat(Int.Font.body))
        XCTAssertEqual(fontNormal, UIFont().styleNormal())
    }

    func testFontTitle() {
        let fontTitle = UIFont.systemFont(ofSize: CGFloat(Int.Font.title))
        XCTAssertEqual(fontTitle, UIFont().styleTitle())
    }

    func testFontSubTitle() {
        let fontSubTitle = UIFont.systemFont(ofSize: CGFloat(Int.Font.subTitle))
        XCTAssertEqual(fontSubTitle, UIFont().styleSubTitle())
    }

    func testFontBoldTitle() {
        let fontBoldTitle = UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.title))
        XCTAssertEqual(fontBoldTitle, UIFont().styleBoldTitle())
    }

    func testFontBoldSubTitle() {
        let fontBoldSubTitle = UIFont.boldSystemFont(ofSize: CGFloat(Int.Font.subTitle))
        XCTAssertEqual(fontBoldSubTitle, UIFont().styleBoldSubTitle())
    }

}
