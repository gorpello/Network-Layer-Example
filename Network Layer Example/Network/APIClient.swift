//
//  APIClient.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation
import Combine

final class APIClient: APIService {
    
    func products() -> AnyPublisher<[Product], APIError> {
        request(.product)
    }
    
    private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        // Make the request
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .tryMap { data, response -> T in
                guard
                    let response = response as? HTTPURLResponse,
                    (200..<300).contains(response.statusCode)
                else {
                    throw APIError.failedRequest
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    print("Unable to decode data, \(error)")
                    throw APIError.invalidResponse
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.failedRequest
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
