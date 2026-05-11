//
//  TodoResponse.swift
//  ExpenseTracker
//
//  Created by Mubashir PM on 11/05/26.
//


import Foundation


struct Product: Codable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
}
