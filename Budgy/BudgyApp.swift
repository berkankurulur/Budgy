//
//  BudgyApp.swift
//  Budgy
//
//  Created by Berkan Kurulur on 20.05.2026.
//

import SwiftUI
import SwiftData

@main
struct BudgyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self, Category.self])
    }
}
