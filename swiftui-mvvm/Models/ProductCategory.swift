//
//  ProductCategory.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

enum Categories {
    case mensclothing
    case womensclothing
    case electronics
    case jewelery
}

struct ProductCategory: Hashable {
    let name: String
}

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
