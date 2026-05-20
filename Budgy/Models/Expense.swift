//
//  Expense.swift
//  Budgy
//
//  Created by Berkan Kurulur on 20.05.2026.
//

import Foundation
import SwiftData


@Model class Expense {
    var id: UUID = UUID()
    var amount: Double
    var note: String
    var date: Date
    var category: Category?
    
    
    init(amount: Double, note: String = "", date: Date = Date(), category: Category? = nil) {
        self.amount = amount
        self.note = note
        self.date = date
        self.category = category
    }
}
