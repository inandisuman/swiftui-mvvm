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

struct ProductCategory: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ProductCategoryResponse: Decodable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let category: String
    let image: String
}
