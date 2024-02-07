//
//  APIEndpoints.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation

enum APIEndpoint {
    
    // MARK: - Cases
    case product
    
    // MARK: - Public Properties
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.addHeaders(headers)
        return request
    }
    
    // MARK: - Private Properties
    private var url: URL {
        Environment.baseURL.appending(component: path)
    }
    
    private var path: String {
        switch self {
        case .product:
            return "product"
        }
    }
    
    // Create a custom header
    private var headers: Headers {
        [
            "Content-Type": "application/json"
        ]
    }
    
}

fileprivate extension URLRequest {
    mutating func addHeaders(_ headers: Headers) {
        headers.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
    }
}
