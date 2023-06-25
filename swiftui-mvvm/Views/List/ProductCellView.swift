//
//  ProductCellView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductCellView: View {
    
    @ObservedObject var product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.title)
                    .foregroundColor(.blue)
                    .bold()
                Text("$\(product.price)")
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: product.isFavourite ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .onTapGesture {
                    product.isFavourite.toggle()
                }
        }
    }
}

//struct ProductCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCellView()
//    }
//}



