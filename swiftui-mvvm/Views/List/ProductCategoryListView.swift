//
//  ProductCategoryListView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductCategoryListView: View {
    
    @StateObject private var productCategoryVewModel =  ProductCategoryListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(productCategoryVewModel.listOfProductCategories, id: \.self) { category in
                    Text(category.name)
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
