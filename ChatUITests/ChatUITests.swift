//
//  ChatUITests.swift
//  ChatUITests
//
//  Created by Maks on 01.12.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import XCTest

class ChatUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testTextFieldAndTextViewsExist() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().navigationBars["Channels"].buttons["Profile"].tap()
//        XCTAssertTrue(app.textFields.element.firstMatch.exists)
//        XCTAssertTrue(app.textViews.element.firstMatch.exists)
        XCTAssertTrue(app.textFields.element.firstMatch.waitForExistence(timeout: 1))
        XCTAssertTrue(app.textViews.element.firstMatch.waitForExistence(timeout: 1))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
