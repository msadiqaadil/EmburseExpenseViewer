//
//  ExpenseCard.swift
//  EmbExpenseViewer
//
//  Created by Sadiq on 16/07/26.
//

import SwiftUI

struct ExpenseCard: View {
    let expense: EMBExpense

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title)
                    .font(.body)
                Text(expense.formattedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 12)

            Text(expense.formattedAmount)
                .font(.body.weight(.semibold))
        }
        .padding(.vertical, 4)
    }
}
