//
//  APIError.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import Foundation

enum APIError: Error {
    case unowned
    case unreachable
    case failedRequest
    case invalidResponse
}
