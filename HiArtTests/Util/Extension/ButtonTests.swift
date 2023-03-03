//
//  ButtonTests.swift
//  HiArtTests
//
//  Created by Daniel Charry on 15/12/22.
//

import XCTest
@testable import HiArt

class ButtonTests: XCTestCase {

    let text = "test string"

    func testButtonTextBold() {
        let buttonTextBold = UIButton()
        buttonTextBold.setTitle(text, for: .normal)
        buttonTextBold.titleLabel?.font = UIFont().styleBold()

        let button = UIButton()
        button.boldText(text)

        XCTAssertEqual(buttonTextBold.titleLabel?.font, button.titleLabel?.font)
    }

    func testButtonTextNormal() {
        let buttonTextNormal = UIButton()
        buttonTextNormal.setTitle(text, for: .normal)
        buttonTextNormal.titleLabel?.font = UIFont().styleNormal()

        let button = UIButton()
        button.normalText(text)

        XCTAssertEqual(buttonTextNormal.titleLabel?.font, button.titleLabel?.font)
    }

}
