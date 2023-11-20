//
//  APIClient.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

protocol APIClient {
    func execute<T: Decodable>(request: URLRequest, responseModel: T.Type) async -> Result<T, RequestError>
}

extension APIClient {
    func execute<T: Decodable>(
        request: URLRequest,
        responseModel: T.Type
    ) async -> Result<T, RequestError> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
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
