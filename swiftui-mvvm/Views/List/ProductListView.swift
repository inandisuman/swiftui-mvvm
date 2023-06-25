//
//  ContentView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductListView: View {
    
    var categorySelected: String
    var productList: ProductList
    @State private var searchText = ""
    @State private var showFavouriteProducts: Bool = false
    
    var body: some View {
        List {
            ForEach(searchedProducts) { product in
                NavigationLink {
                    ProductDetailsView(product: product)
                } label: {
                    ProductCellView(product: product)
                }
            }
        }
        .navigationTitle(categorySelected)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .toolbar {
            ToolbarItem {
                Button {
                    showFavouriteProducts.toggle()
                } label: {
                    Text("Favourites")
                }
            }
        }
    }
    
    var filteredProductsByCategory: [Product] {
        if !categorySelected.isEmpty {
            return productList.products.filter { $0.category == categorySelected }
        } else {
            return productList.products
        }
    }
    
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return filteredProductsByCategory
        } else {
            return filteredProductsByCategory.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
