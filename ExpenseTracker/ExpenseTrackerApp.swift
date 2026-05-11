//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {

    var body: some Scene {

        WindowGroup {
            ExpenseListView()
        }
        .modelContainer(for: Expense.self)
    }
}
