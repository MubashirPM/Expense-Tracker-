//
//  ExpenseModel .swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//

import Foundation
import Foundation
import SwiftData

@Model
class Expense {

    var id: Int
    var amount: Double
    var category: String
    var note: String
    var date: Date
    var isPaid: Bool

    init(
        id: Int,
        amount: Double,
        category: String,
        note: String,
        date: Date,
        isPaid: Bool
    ) {
        self.id = id
        self.amount = amount
        self.category = category
        self.note = note
        self.date = date
        self.isPaid = isPaid
    }
}
