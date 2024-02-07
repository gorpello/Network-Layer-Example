//
//  APIPreviewClient.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation
import Combine

final class APIPreviewClient: APIService {
    
    
    func products() -> AnyPublisher<[Product], APIError> {
        
        let url = Bundle.main.url(forResource: "Products", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let products = try! JSONDecoder().decode([Product].self, from: data)
        print(products)
        guard
            let url = Bundle.main.url(forResource: "Products", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let products = try? JSONDecoder().decode([Product].self, from: data)
        else {
            fatalError("Unable to load data...")
        }
        
        return Just(products)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
}
