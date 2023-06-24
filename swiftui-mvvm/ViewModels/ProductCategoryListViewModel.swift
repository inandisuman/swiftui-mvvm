//
//  ProductCategoryListViewModel.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

@MainActor
class ProductCategoryListViewModel: ObservableObject {
    
    @Published var listOfCategories = [ProductCategory]()
    
    var listOfProducts: [Product]
    
    init(listOfProducts: [Product]) {
        self.listOfProducts = listOfProducts
    }

    func getAllProducts() async {
        do  {
            self.listOfProducts = try await NetworkManager.shared.getAllProducts(url: Constants.Urls.getAllProducts)
        } catch {
            print(error)
        }
        
        let duplicatelistOfProductCategories = self.listOfProducts.map {
            ProductCategory.init(name: $0.category ) }
        self.listOfCategories = Array(Set(duplicatelistOfProductCategories))
    }
    
    func filteredProducts(category: String) -> [Product] {
        return self.listOfProducts.filter { $0.category == category }
    }
}
