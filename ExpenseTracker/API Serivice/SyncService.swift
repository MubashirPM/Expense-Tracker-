//
//  SyncService.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import Foundation
import SwiftData

class SyncService {
    
    let apiService = APIService()
    
    func syncExpenses(context: ModelContext) async {
        
        do {
            
            let products = try await apiService.fetchExpenses()
            
            for product in products {
                
                let fetchDescriptor = FetchDescriptor<Expense>(
                    predicate: #Predicate {
                        $0.id == product.id
                    }
                )
                
                let existingExpense = try context.fetch(fetchDescriptor)
                
                if existingExpense.isEmpty {
                    
                    let expense = Expense(
                        id: product.id,
                        amount: product.price,
                        category: product.category,
                        note: product.title,
                        date: Date(),
                        isPaid: Bool.random()
                    )
                    
                    context.insert(expense)
                }
            }
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
}
