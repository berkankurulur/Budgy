//
//  OverviewView.swift
//  Budgy
//
//  Created by Berkan Kurulur on 20.05.2026.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
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
        
        Spacer()
        
        
        
    }
}


struct CategoryCard: View {
    let emoji: String
    let name: String
    
    var body: some View {
        VStack(spacing: 8){
            Text(emoji)
                .font(.largeTitle)
            Text(name)
                .font(.caption)
                .foregroundColor(.secondary)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x:0, y:2)
    }
}
    
#Preview {
    OverviewView()
}
