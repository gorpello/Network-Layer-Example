//
//  Product.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let images: [String]
    let creationAt: String
    let updatedAt: String
    let category: Category
}
