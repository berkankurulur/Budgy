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
    
    let container : ModelContainer
    
    init() {
        do{
            container = try ModelContainer(for: Expense.self, Category.self)
            seedCategoriesIfNeeded()
        } catch {
            fatalError("Failed to create ModelContainer : \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
    
    private func seedCategoriesIfNeeded() {
        let context = container.mainContext
        let descriptor = FetchDescriptor<Category>()
        
        guard let count = try? context.fetchCount(descriptor), count == 0 else { return }
        
        let categories = [
                   Category(name: "Food", emoji: "🍔"),
                   Category(name: "Transport", emoji: "🚗"),
                   Category(name: "Shopping", emoji: "🛍️"),
                   Category(name: "Entertainment", emoji: "🎬"),
                   Category(name: "Bills", emoji: "💡"),
                   Category(name: "Health", emoji: "⚕️"),
                   Category(name: "Other", emoji: "📝")
               ]
        
        for category in categories {
            context.insert(category)
        }
        
    }
    
}
