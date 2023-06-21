//
//  ProductListViewModel.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var listOfProducts = [Product]()
    
    func getAllProducts() async {
        do  {
            listOfProducts = try await NetworkManager.shared.getAllProducts(url: Constants.Urls.getAllProducts)
        } catch {
            print(error)
        }
    }
}
