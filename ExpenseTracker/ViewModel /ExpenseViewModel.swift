//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import SwiftUI

import Foundation
import SwiftData

@Observable
class ExpenseViewModel {

    var searchText: String = ""

    var selectedStatus: String = "All"

    var selectedCategory: String = "All"

    let categories = [
        "All",
        "Electronics",
        "Jewelry",
        "Men's Clothing",
        "Women's Clothing"
    ]

    func addExpense(
        context: ModelContext,
        amount: Double,
        category: String,
        note: String,
        date: Date,
        isPaid: Bool
    ) {

        let expense = Expense(
            id: Int(Date().timeIntervalSince1970),
            amount: amount,
            category: category,
            note: note,
            date: date,
            isPaid: isPaid
        )

        context.insert(expense)
    }

    func deleteExpense(
        context: ModelContext,
        expense: Expense
    ) {

        context.delete(expense)
    }

    func togglePaid(expense: Expense) {

        expense.isPaid.toggle()
    }

    func filteredExpenses(
        expenses: [Expense]
    ) -> [Expense] {

        expenses.filter { expense in

            let matchesSearch =
            searchText.isEmpty ||
            expense.category.localizedCaseInsensitiveContains(searchText) ||
            expense.note.localizedCaseInsensitiveContains(searchText)

            let matchesStatus =
            selectedStatus == "All" ||
            (selectedStatus == "Paid" && expense.isPaid) ||
            (selectedStatus == "Pending" && !expense.isPaid)

            return matchesSearch && matchesStatus
        }
    }
}


struct FilterButton: View {

    let title: String

    let isSelected: Bool

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(
                    isSelected ?
                    Color.blue :
                    Color.gray.opacity(0.2)
                )
                .foregroundStyle(
                    isSelected ?
                    .white :
                    .black
                )
                .clipShape(Capsule())
        }
    }
}
