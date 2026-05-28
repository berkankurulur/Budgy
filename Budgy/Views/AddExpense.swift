//
//  AddExpense.swift
//  Budgy
//
//  Created by Berkan Kurulur on 21.05.2026.
//

import SwiftUI

struct AddExpense: View {
    
    @State private var amount: String = ""
    @State private var selectedCategory: String = "Food"
    
   
    
    var body: some View {
        VStack {
            // 1. HStack — başlık
            HStack {
                Button {
                    
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
                CategoryCard(emoji: "🍔", name: "Food", isSelected: selectedCategory == "Food")
                    .onTapGesture {
                        selectedCategory = "Food"
                    }
                    CategoryCard(emoji: "🚗", name: "Transport", isSelected: selectedCategory == "Transport")
                    .onTapGesture {
                        selectedCategory = "Transport"
                    }
                    CategoryCard(emoji: "🛍️", name: "Shopping", isSelected: selectedCategory == "Shopping")
                    .onTapGesture {
                        selectedCategory = "Shopping"
                    }
                    CategoryCard(emoji: "🎬", name: "Entertainment", isSelected: selectedCategory == "Entertainment")
                    .onTapGesture {
                        selectedCategory = "Entertainment"
                    }
                    CategoryCard(emoji: "💡", name: "Bills", isSelected: selectedCategory == "Bills")
                    .onTapGesture {
                        selectedCategory = "Bills"
                    }
                    CategoryCard(emoji: "⚕️", name: "Health", isSelected: selectedCategory == "Health")
                    .onTapGesture {
                        selectedCategory = "Health"
                    }
                    CategoryCard(emoji: "📝", name: "Other", isSelected: selectedCategory == "Other")
                    .onTapGesture {
                        selectedCategory = "Other"
                    }
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    AddExpense()
}
