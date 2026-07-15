//
//  EMBExpenseParserTests.swift
//  EmbExpenseViewerTests
//
//  Created by Sadiq on 16/07/26.
//

import XCTest
@testable import EmbExpenseViewer

final class EMBExpenseParserTests: XCTestCase {

    func testParsesExpenses() throws {
        let data = """
        [{"id":"1","title":"Coffee","amount":3.5,"date":"2021-07-03T01:50:00+01:00"}]
        """.data(using: .utf8)!

        let expenses = try EMBExpenseParser.expenses(from: data)

        XCTAssertEqual(expenses.count, 1)
    }

    func testThrowsForInvalidJSON() {
        let data = "not json".data(using: .utf8)!

        XCTAssertThrowsError(try EMBExpenseParser.expenses(from: data))
    }
}
