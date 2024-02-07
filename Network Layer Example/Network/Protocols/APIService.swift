//
//  APIService.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation
import Combine

protocol APIService {
    func products() -> AnyPublisher<[Product], APIError> 
}
