//
//  ExpenseListView.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import SwiftUI
import SwiftData

struct ExpenseListView: View {

    @Environment(\.modelContext) var context

    @Query(sort: \Expense.date, order: .reverse)
    var expenses: [Expense]

    @State private var showAddExpense = false

    @State private var selectedExpense: Expense?

    @State private var viewModel = ExpenseViewModel()

    var body: some View {

        NavigationStack {

            VStack {

                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 12) {

                        FilterButton(
                            title: "All",
                            isSelected: viewModel.selectedStatus == "All"
                        ) {

                            viewModel.selectedStatus = "All"
                        }

                        FilterButton(
                            title: "Paid",
                            isSelected: viewModel.selectedStatus == "Paid"
                        ) {

                            viewModel.selectedStatus = "Paid"
                        }

                        FilterButton(
                            title: "Pending",
                            isSelected: viewModel.selectedStatus == "Pending"
                        ) {

                            viewModel.selectedStatus = "Pending"
                        }
                    }
                    .padding(.horizontal)
                }

                List {

                    ForEach(
                        viewModel.filteredExpenses(
                            expenses: expenses
                        )
                    ) { expense in

                        ExpenseRowView(expense: expense)

                            .swipeActions(edge: .leading) {

                                Button {

                                    viewModel.togglePaid(
                                        expense: expense
                                    )

                                } label: {

                                    Label(
                                        "Toggle",
                                        systemImage: "checkmark"
                                    )
                                }
                                .tint(.green)
                            }

                            .swipeActions {

                                Button(role: .destructive) {

                                    viewModel.deleteExpense(
                                        context: context,
                                        expense: expense
                                    )

                                } label: {

                                    Label(
                                        "Delete",
                                        systemImage: "trash"
                                    )
                                }

                                Button {

                                    selectedExpense = expense

                                } label: {

                                    Label(
                                        "Edit",
                                        systemImage: "pencil"
                                    )
                                }
                                .tint(.blue)
                            }
                    }
                }
                .listStyle(.plain)
            }

            .navigationTitle("Expenses")

            .searchable(
                text: $viewModel.searchText,
                prompt: "Search Expenses"
            )

            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button {

                        showAddExpense = true

                    } label: {

                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .topBarLeading) {

                    Button("Sync") {

                        Task {

                            await SyncService().syncExpenses(
                                context: context
                            )
                        }
                    }
                }
            }

            .sheet(isPresented: $showAddExpense) {

                AddEditExpenseView()
            }

            .sheet(item: $selectedExpense) { expense in

                AddEditExpenseView(
                    expense: expense
                )
            }
        }
    }
}
