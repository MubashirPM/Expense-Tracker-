//
//  APIService.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import Foundation

class APIService {
    
    func fetchExpenses() async throws -> [Product] {
        
        let url = URL(string: "https://fakestoreapi.com/products")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try JSONDecoder().decode(
            [Product].self,
            from: data
        )
        
        return products
    }
}
