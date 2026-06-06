//
//  OverviewView.swift
//  Budgy
//
//  Created by Berkan Kurulur on 20.05.2026.
//

import SwiftUI
import SwiftData

struct OverviewView: View {
    
    @State private var showAddExpence = false
    
    @Query(sort: \Expense.date, order: .reverse) private var expenses: [Expense]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
        ScrollView {
            VStack(alignment: .leading, spacing: 12){
            Text("Total Balance")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            Text("190.50")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Today")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("40,50")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                
                VStack(alignment: .trailing, spacing: 4){
                    Text("This Month")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("190.50")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
            }
            .padding(.top, 8)
            
        }
        .padding(20)
        .background(
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .padding()
        
        
        Text("Categories")
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
        LazyVGrid(columns: columns, spacing: 12) {
                CategoryCard(emoji: "🍔", name: "Food")
                CategoryCard(emoji: "🚗", name: "Transport")
                CategoryCard(emoji: "🛍️", name: "Shopping")
                CategoryCard(emoji: "🎬", name: "Entertainment")
                CategoryCard(emoji: "💡", name: "Bills")
                CategoryCard(emoji: "⚕️", name: "Health")
                CategoryCard(emoji: "📝", name: "Other")
        }
        .padding(.horizontal)
        
        VStack(spacing: 12){
            Text("Recents")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ForEach(expenses) { expense in
                ExpenseRow(emoji: "💰", category: "Genel", note: expense.note, amount: expense.amount, date: expense.date, isIncome: expense.isIncome)
                
            }
            
            
            
        }.padding(.horizontal)
        
            }
            Button {
                showAddExpence = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }                                                                                                        
        }
        .padding()
        
        .sheet(isPresented: $showAddExpence) {
            AddExpense()
        }
    }
}





struct CategoryCard: View {
    let emoji: String
    let name: String
    
    var isSelected : Bool = false
    
    var body: some View {
        VStack(spacing: 8){
            Text(emoji)
                .font(.largeTitle)
            Text(name)
                .font(.caption)
                .foregroundColor(isSelected ? .white : .secondary)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x:0, y:2)
    }
}
 




struct ExpenseRow: View {
    var emoji: String
    var category: String
    var note: String
    var amount: Double
    var date:  Date
    var isIncome: Bool = false
    
    var body: some View {
        HStack{
            Text(emoji)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2){
                Text(category)
                    .fontWeight(.semibold)
                Text(note)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                
            }
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text(isIncome ? "+$\(amount, specifier: "%.2f")" : "-$\(amount, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(isIncome ? .green : .red)
                
                Text(date, format: .dateTime.month(.abbreviated).day())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            }
        }
}



#Preview {
    OverviewView()
}
