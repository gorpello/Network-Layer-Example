//
//  ProductPage.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import SwiftUI

struct ProductPage: View {
    
    let product: Product
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Image as Top Header
                AsyncImage(url: URL(string: product.images.first!)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height / 3)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                
                Group{
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 80)
                    
                    Text("$\(product.price)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 20)
                
                
            }
        }
        .navigationBarTitle("Product Details", displayMode: .inline)
    }
}

#Preview {
    return ProductPage(product: Product(id: 0,
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
