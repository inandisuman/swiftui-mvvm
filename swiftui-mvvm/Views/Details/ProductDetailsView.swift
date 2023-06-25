//
//  ProductDetailsView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Text(product.description)
            
            Button {
                // Add to favourites
                product.isFavourite = true
            } label: {
                Text("Add to Favourites")
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView()
//    }
//}
