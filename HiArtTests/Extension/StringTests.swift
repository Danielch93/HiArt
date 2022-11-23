//
//  StringTests.swift
//  HiArtTests
//
//  Created by Daniel Charry on 22/11/22.
//

import XCTest
@testable import HiArt

class StringTests: XCTestCase {

    let text = "HiArt!"
    var fontSize: CGFloat { return 18 }
    let string = NSMutableAttributedString()
    var normalFont: UIFont { return UIFont.systemFont(ofSize: fontSize) }
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: fontSize) }

    func bold() -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        string.append(NSAttributedString(string: text,
                                         attributes: attributes))
        return string
    }

    func normal() -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.font: normalFont]
        string.append(NSAttributedString(string: text,
                                         attributes: attributes))
        return string
    }

    func testStringSize() {
        let fontSize = NSMutableAttributedString().fontSize
        XCTAssertEqual(self.fontSize, fontSize)
    }

    func testFontBold() {
        let boldFont = NSMutableAttributedString().boldFont
        XCTAssertEqual(self.boldFont, boldFont)
    }

    func testFontNormal() {
        let normalFont = NSMutableAttributedString().normalFont
        XCTAssertEqual(self.normalFont, normalFont)
    }

    func testBoldStyle() {
        let bold = NSMutableAttributedString().bold(text)
        XCTAssertEqual(self.bold(), bold)
    }

    func testNormalStyle() {
        let normal = NSMutableAttributedString().normal(text)
        XCTAssertEqual(self.normal(), normal)
    }

}
