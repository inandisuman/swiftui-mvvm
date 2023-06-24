//
//  ContentView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var productListViewModel = ProductListViewModel()
    var productsByCategory: [Product]
    @State private var searchText = " "
    
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
        .navigationTitle(productsByCategory.first!.category)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return productsByCategory
        } else {
            return productsByCategory.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        
    }
}
