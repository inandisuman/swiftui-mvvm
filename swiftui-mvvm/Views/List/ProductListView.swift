//
//  ContentView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var favProducts = FavouriteProducts()
    var productsByCategory: [Product]
    @State private var searchText = " "
    @State private var showFavouriteProducts: Bool = false
    
    var body: some View {
        List {
            ForEach(filteredProducts) { product in
                NavigationLink {
                    ProductDetailsView(favProducts: favProducts, product: product)
                } label: {
                    ProductCellView(product: product)
                }
            }
        }
        .navigationTitle(productsByCategory.first!.category)
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
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return productsByCategory
        } else {
            return productsByCategory.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        
    }
    
    var filteredProducts: [Product] {
        if showFavouriteProducts {
            return favProducts.products
        } else {
            return productsByCategory
        }
    }
}
