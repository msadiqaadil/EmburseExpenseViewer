//
//  ExpenseListViewModelTests.swift
//  EmbExpenseViewerTests
//
//  Created by Sadiq on 15/07/26.
//

import XCTest
@testable import EmbExpenseViewer

struct MockError: Error {}

struct FakeExpenseProvider: ExpenseProvider {
    let expenses: [EMBExpense]

    func fetchExpenses() async throws -> [EMBExpense] {
        expenses
    }
}

struct FailingExpenseProvider: ExpenseProvider {
    func fetchExpenses() async throws -> [EMBExpense] {
        throw MockError()
    }
}

@MainActor
final class ExpenseListViewModelTests: XCTestCase {

    func makeExpense() -> EMBExpense {
        EMBExpense(dictionary: [
            "id": "1",
            "title": "Coffee",
            "amount": 3.5,
            "date": "2021-07-03T01:50:00+01:00"
        ])!
    }

    func testStartsInLoadingState() {
        let viewModel = ExpenseListViewModel(service: FakeExpenseProvider(expenses: []))
        XCTAssertEqual(viewModel.loadingState, .loading)
    }

    func testLoadsExpenses() async {
        let viewModel = ExpenseListViewModel(service: FakeExpenseProvider(expenses: [makeExpense()]))

        await viewModel.loadExpenses()

        guard case .loaded(let expenses) = viewModel.loadingState else {
            XCTFail("expected loaded state")
            return
        }
        XCTAssertEqual(expenses.count, 1)
    }

    func testShowsErrorWhenFetchFails() async {
        let viewModel = ExpenseListViewModel(service: FailingExpenseProvider())

        await viewModel.loadExpenses()

        guard case .error = viewModel.loadingState else {
            XCTFail("expected error state")
            return
        }
    }
}
