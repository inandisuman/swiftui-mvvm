//
//  ProductCellView.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
                .foregroundColor(.blue)
                .bold()
            Text("$\(product.price)")
                .font(.subheadline)
        }
    }
}

//struct ProductCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCellView()
//    }
//}



