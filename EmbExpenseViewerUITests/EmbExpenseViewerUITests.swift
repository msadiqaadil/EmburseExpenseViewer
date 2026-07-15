//
//  EmbExpenseViewerUITests.swift
//  EmbExpenseViewerUITests
//
//  Created by Sadiq on 15/07/26.
//

import XCTest

final class EmbExpenseViewerUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowsExpensesTitle() {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.navigationBars["Expenses"].waitForExistence(timeout: 5))
    }

    func testShowsSomeExpenses() {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.cells.firstMatch.waitForExistence(timeout: 15))
    }
}
