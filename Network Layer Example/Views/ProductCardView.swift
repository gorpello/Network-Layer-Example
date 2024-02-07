//
//  ProductCardView.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.images.first!)!)
            { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                   
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    // pleasee never o something like this...
    // shame on me...
    return ProductCardView(product: Product(id: 0,
                                     title: "Test Card",
                                     price: 3,
                                     description: "Description",
                                     images: ["https://i.imgur.com/1twoaDy.jpeg"],
                                     creationAt: "",
                                     updatedAt: "",
                                     category: Category(id: 0,
                                                        name: "",
                                                        image: "", creationAt: "", updatedAt: "")))
}
