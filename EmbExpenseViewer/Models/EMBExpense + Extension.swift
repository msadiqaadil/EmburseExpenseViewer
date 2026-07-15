//
//  EMBExpense + Extension.swift
//  EmbExpenseViewer
//
//  Created by Sadiq on 16/07/26.
//
extension EMBExpense {
    var formattedDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    var formattedAmount: String {
        amount.formatted(
            .currency(code: Locale.current.currency?.identifier ?? "USD")
        )
    }
}
