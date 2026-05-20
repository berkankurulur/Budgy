//
//  Category.swift
//  Budgy
//
//  Created by Berkan Kurulur on 20.05.2026.
//

import Foundation
import SwiftData
 

@Model class Category {
    var id: UUID = UUID()
    var name: String
    var emoji: String
    
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
       
    }
}
