//
//  ContentView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var productListViewModel = ProductListViewModel()
    @State private var searchText = " "

    var body: some View {
        NavigationView {
            List {
                ForEach(searchedProducts) { product in
                    ProductCellView(product: product)
                }
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search by title")
        }
        .task {
            await productListViewModel.getAllProducts()
        }
    }
    
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return productListViewModel.listOfProducts
        } else {
            return productListViewModel.listOfProducts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
