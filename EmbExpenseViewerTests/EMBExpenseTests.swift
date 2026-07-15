//
//  EMBExpenseTests.swift
//  EmbExpenseViewerTests
//
//  Created by Sadiq on 16/07/26.
//

import XCTest
@testable import EmbExpenseViewer

final class EMBExpenseTests: XCTestCase {

    func testCreatesExpenseFromValidDictionary() {
        let expense = EMBExpense(dictionary: [
            "id": "1",
            "title": "Tea",
            "amount": 3.5,
            "date": "2021-07-03T01:50:00+01:00"
        ])

        XCTAssertNotNil(expense)
        XCTAssertEqual(expense?.id, "1")
        XCTAssertEqual(expense?.title, "Tea")
        XCTAssertEqual(expense?.amount, 3.5)
    }

    func testReturnsNilWhenFieldMissing() {
        let expense = EMBExpense(dictionary: ["id": "1"])
        XCTAssertNil(expense)
    }

    func testReturnsNilForBadDate() {
        let expense = EMBExpense(dictionary: [
            "id": "1",
            "title": "Tea",
            "amount": 3.5,
            "date": "not a date"
        ])
        XCTAssertNil(expense)
    }
}
