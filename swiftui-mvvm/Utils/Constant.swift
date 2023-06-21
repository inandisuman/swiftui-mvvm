//
//  Constant.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

struct Constants {
    struct Urls {
        static let getAllProducts = URL(string: "https://fakestoreapi.com/products/")!
        static func getProductById(_ id: String) -> URL {
            return URL(string: "https://fakestoreapi.com/products/\(id)")!
        }
    }
}
