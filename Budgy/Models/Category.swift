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
    var icon: String
    var colorHex: String
    
    init(name: String, icon: String, colourHex: String) {
        self.name = name
        self.icon = icon
        self.colorHex = colourHex
    }
}
