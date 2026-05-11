//
//  AddEditExpenseView.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import SwiftUI
import SwiftData

struct AddEditExpenseView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    var expense: Expense?

    @State private var amount = ""
    @State private var category = ""
    @State private var note = ""
    @State private var date = Date()
    @State private var isPaid = false

    var body: some View {

        NavigationStack {

            Form {

                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)

                TextField("Category", text: $category)

                TextField("Note", text: $note)

                DatePicker(
                    "Date",
                    selection: $date,
                    displayedComponents: .date
                )

                Toggle("Paid", isOn: $isPaid)
            }

            .navigationTitle(
                expense == nil ? "Add Expense" : "Edit Expense"
            )

            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Save") {

                        if let expense {

                            expense.amount = Double(amount) ?? 0
                            expense.category = category
                            expense.note = note
                            expense.date = date
                            expense.isPaid = isPaid

                        } else {

                            let newExpense = Expense(
                                id: Int(Date().timeIntervalSince1970),
                                amount: Double(amount) ?? 0,
                                category: category,
                                note: note,
                                date: date,
                                isPaid: isPaid
                            )

                            context.insert(newExpense)
                        }

                        dismiss()
                    }
                }
            }

            .onAppear {

                if let expense {

                    amount = "\(expense.amount)"
                    category = expense.category
                    note = expense.note
                    date = expense.date
                    isPaid = expense.isPaid
                }
            }
        }
    }
}
