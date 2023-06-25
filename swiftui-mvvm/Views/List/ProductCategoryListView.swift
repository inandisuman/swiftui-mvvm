//
//  ProductCategoryListView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductCategoryListView: View {
    
    @StateObject private var productCategoryVewModel =  ProductCategoryListViewModel(productList: ProductList())
    @State private var selectedCategory = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(productCategoryVewModel.listOfCategories, id: \.self) { category in
                    NavigationLink(destination: {
                        // Go to Products
                        ProductListView(categorySelected: category.name, productList: productCategoryVewModel.productList)
                    }, label: {
                        Text(category.name)
                    })
                }
                .navigationTitle("Categories")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            await productCategoryVewModel.getAllProducts()
        }
    }
}

struct ProductCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategoryListView()
    }
}
