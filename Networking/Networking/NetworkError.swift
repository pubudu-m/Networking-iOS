//
//  NetworkError.swift
//  Networking
//
//  Created by Idirimuni Pubudu Mihiranga De Silva on 2024-03-04.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noResponse
    case unauthorized
    case decode
    case unexpectedStatusCode
    case unknown
}
