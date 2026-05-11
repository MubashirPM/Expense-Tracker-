//
//  ExpenseRowView.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import SwiftUI

struct ExpenseRowView: View {

    let expense: Expense

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack {

                VStack(alignment: .leading) {

                    Text(expense.category)
                        .font(.headline)

                    Text(expense.note)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }

                Spacer()

                Text("₹\(expense.amount, specifier: "%.0f")")
                    .fontWeight(.bold)
            }

            HStack {

                Text(expense.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)

                Spacer()

                Text(expense.isPaid ? "Paid" : "Pending")
                    .foregroundStyle(
                        expense.isPaid ? .green : .orange
                    )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 2)
    }
}