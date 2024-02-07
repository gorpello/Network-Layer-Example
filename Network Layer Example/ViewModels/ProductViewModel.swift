//
//  ProductViewModel.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import SwiftUI
import Combine

final class ProductViewModel: ObservableObject {
    
    @Published
    private(set) var products: [Product] = []
    
    @Published
    private(set) var isFetching = false
    
    @Published
    private(set) var errorMessage: String?
    
    // MARK: - Privates Properties
    
    private var subscriptions: Set<AnyCancellable> = []
    
    private var apiService: APIService
    
    // MARK: - Public Functions
    
    init(apiService: APIService) {
        self.apiService = apiService
        fetchProduct()
    }
    
    
    // MARK: - Private Function
    
    private func fetchProduct() {
        isFetching = true
         
        apiService.products()
            .sink { [weak self] completion in
                self?.isFetching = false
                
                switch completion {
                case .finished:
                    print("Success!")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
                
            } receiveValue: { [weak self] products in
                self?.products = products
            }
            .store(in: &subscriptions)

        
    }
    
}
