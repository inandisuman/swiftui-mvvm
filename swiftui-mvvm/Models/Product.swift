//
//  Product.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let category: String
    let image: String
}
