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
    
    var productList: ProductList
    
    init(productList: ProductList) {
        self.productList = productList
    }

    func getAllProducts() async {
        var productResposne = [ProductResponse]()
        do  {
            productResposne = try await NetworkManager.shared.getAllProducts(url: Constants.Urls.getAllProducts)
        } catch {
            print(error)
        }
        
        // Map response to Product
        self.productList.products = productResposne.map { response in
            Product(id: response.id, title: response.title, price: response.price, description: response.description, category: response.category.rawValue, image: response.image, isFavourite: false)
        }
        
        // Map response to only categories
        let duplicatelistOfProductCategories = productResposne.map {
            ProductCategory.init(name: $0.category.rawValue ) }
        self.listOfCategories = Array(Set(duplicatelistOfProductCategories))
    }
    
    func filteredProducts(category: String) -> [Product] {
        return self.productList.products.filter { $0.category == category }
    }
}
