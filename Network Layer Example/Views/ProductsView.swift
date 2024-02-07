//
//  ContentView.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import SwiftUI

struct ProductsView: View {
    
    var viewModel: ProductViewModel
    
    var progress: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
    
    var productList: some View {
        List(viewModel.products) { product in
            ZStack {
                NavigationLink(destination:
                                ProductPage(product: product)) {
                    EmptyView()
                }
                ProductCardView(product: product)
            }
            .listRowSeparator(.hidden)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isFetching {
                    progress
                } else {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    } else {
                        productList
                            .listStyle(.plain)
                    }
                }
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ProductsView(viewModel:
                    ProductViewModel(apiService: APIPreviewClient())
    )
}
