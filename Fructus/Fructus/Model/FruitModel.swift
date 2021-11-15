//
//  FruitModel.swift
//  Fructus
//
//  Created by Patrick Spafford on 10/11/21.
//

import SwiftUI

// MARK: - Fruits Data Model

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    // Nutrition should definitely be either its own struct or a dict
    var nutrition: [String]
}

