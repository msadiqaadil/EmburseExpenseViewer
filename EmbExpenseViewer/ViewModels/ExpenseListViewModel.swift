//
//  ExpenseListViewModel.swift
//  EmbExpenseViewer
//
//  Created by Sadiq on 16/07/26.
//

import Foundation
import Observation

protocol ExpenseProvider {
    func fetchExpenses() async throws -> [EMBExpense]
}

extension EMBExpenseService: ExpenseProvider {}
extension EMBExpense: Identifiable {}

@Observable
class ExpenseListViewModel {
    
    enum LoadingState: Equatable {
        case loading
        case loaded([EMBExpense])
        case error(String)
    }
    
    private(set) var loadingState: LoadingState = .loading
    
    @ObservationIgnored private let service: ExpenseProvider
    @ObservationIgnored private var expenses =  [EMBExpense]()
    
    init(service: ExpenseProvider = EMBExpenseService(endpointURL: AppConfig.expensesEndpoint)) {
        self.service = service
    }
    
    func loadExpenses() async {
        loadingState = .loading
        do {
            expenses = try await service.fetchExpenses().sorted { $0.date > $1.date }
            loadingState = .loaded(expenses)
        } catch {
            loadingState = .error(error.localizedDescription)
        }
    }
    
}

