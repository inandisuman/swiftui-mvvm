//
//  Product.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

class ProductList {
    var products = [Product]()
}

class Product: ObservableObject, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    @Published var isFavourite: Bool
    
    init(id: Int, title: String, price: Double, description: String, category: String, image: String, isFavourite: Bool) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
        self.isFavourite = isFavourite
    }
}
