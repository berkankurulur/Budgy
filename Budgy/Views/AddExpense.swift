//
//  AddExpense.swift
//  Budgy
//
//  Created by Berkan Kurulur on 21.05.2026.
//

import SwiftUI
import SwiftData

struct AddExpense: View {
    
    @State private var amount: String = ""
    @State private var selectedCategory: Category? = nil
    @State private var note: String = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query private var categories : [Category]
    
   
    
    var body: some View {
        VStack {
            // 1. HStack — başlık
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Text("Add Expense")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
            // 2. HStack — tutar girişi
            HStack {
                Text("$")
                    .font(.title)
                    .foregroundColor(.gray)
                
                TextField("0.00", text: $amount)
                    .font(.title)
                    .keyboardType(.decimalPad)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding(.horizontal)
            
            Text("Category")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(categories) { category in
                    CategoryCard(
                        emoji: category.emoji,
                        name: category.name,
                        isSelected: selectedCategory?.id == category.id
                    )
                    .onTapGesture{
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal)
            
            Text("Description (optional)")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            TextField("What did you spend on", text: $note)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            
            
            Spacer()
            
            Button{
                guard let amountValue = Double(amount) else { return }
                 
                let newExpense = Expense(
                amount: amountValue,
                note: note,
                date: Date(),
                category: selectedCategory,
                isIncome: false)
                
                
                modelContext.insert(newExpense)
                
                dismiss()
                
                
            }label: {
                Text("Add expense")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

        }
    }
}

#Preview {
    AddExpense()
}
