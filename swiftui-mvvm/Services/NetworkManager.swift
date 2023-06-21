//
//  NetworkManager.swift
//  swiftui-mvvm
//
//  Created by Suman Nandi on 21/06/23.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidStatusCode
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getAllProducts<T: Decodable> (url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let urlResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        // Check the status code is between 200 and 299
        if !(200..<300).contains(urlResponse.statusCode) {
            throw APIError.invalidStatusCode
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
