//
//  NetworkingClient.swift
//  Networking
//
//  Created by Idirimuni Pubudu Mihiranga De Silva on 2024-03-04.
//

import Foundation

protocol NetworkingClient {
    func sendRequest<T: Decodable>(apiTarget: BaseAPITarget, responseModel: T.Type) async -> Result<T, NetworkError>
}

extension NetworkingClient {
    func sendRequest<T: Decodable>(apiTarget: BaseAPITarget, responseModel: T.Type) async -> Result<T, NetworkError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = apiTarget.scheme
        urlComponents.host = apiTarget.host
        urlComponents.path = apiTarget.path
        
        guard let url = urlComponents.url else { return .failure(.invalidURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiTarget.method.rawValue
        request.allHTTPHeaderFields = apiTarget.headers
        
        // Improve
        if let body = apiTarget.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            // Improve
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
