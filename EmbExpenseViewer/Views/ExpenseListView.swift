//
//  ExpenseListView.swift
//  EmbExpenseViewer
//
//  Created by Sadiq on 16/07/26.
//

import SwiftUI

struct ExpenseListView: View {
    @State private var viewModel = ExpenseListViewModel()

    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle(Strings.expensesTitle)
                .task { await viewModel.loadExpenses() }
        }
        
    }
    
    @ViewBuilder
    private var contentView : some View {
        switch viewModel.loadingState {
        case .loading:
            ProgressView(Strings.loading)

        case .loaded(let expenses):
            List(expenses) { ExpenseCard(expense: $0) }

        case .error(let message):
            ContentUnavailableView {
                Label(Strings.errorTitle, systemImage: "exclamationmark.triangle")
            } description: {
                Text(message)
            } actions: {
                Button(Strings.retry) {
                    Task { await viewModel.loadExpenses() }
                }
            }
        }
    }
}

#Preview {
    ExpenseListView()
}
