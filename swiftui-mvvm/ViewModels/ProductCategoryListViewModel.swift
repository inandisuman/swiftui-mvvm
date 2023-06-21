//
//  ProductCategoryListViewModel.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

@MainActor
class ProductCategoryListViewModel: ObservableObject {
    
    @Published var listOfProductCategories = [ProductCategory]()
    
    func getAllProducts() async {
        var listOfProductCategoriesFromService = [ProductCategoryResponse]()
        do  {
            listOfProductCategoriesFromService = try await NetworkManager.shared.getAllProducts(url: Constants.Urls.getAllProducts)
        } catch {
            print(error)
        }
        
        let duplicatelistOfProductCategories = listOfProductCategoriesFromService.map {
            ProductCategory.init(name: $0.category) }
        self.listOfProductCategories = Array(Set(duplicatelistOfProductCategories))
    }
}
