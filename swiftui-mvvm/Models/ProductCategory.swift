//
//  ProductCategory.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

enum Categories: String, Decodable {
    case mensclothing = "men's clothing"
    case womensclothing = "women's clothing"
    case electronics = "electronics"
    case jewelery = "jewelery"
}

struct ProductCategory: Hashable {
    let name: String
}

struct ProductResponse: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Categories
    let image: String
}
