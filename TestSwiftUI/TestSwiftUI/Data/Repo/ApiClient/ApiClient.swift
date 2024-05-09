//
//  ApiClient.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public enum ServerError: Error {
    case error(code: Int?, message: String?)
}

public protocol ApiClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

public final class TestApiClient: NSObject, ApiClient {
    
    // MARK: - Public properties -
    
    public func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        guard let url = URL(string: endpoint.host + "/" + endpoint.path) else {
            throw ServerError.error(code: 404, message: "Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        print("→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→  URL  ←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←")
        print("[🌐 \(url)]")
        print("→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→ BODY ←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←")
        print(" 👉🏻 \(String(describing: endpoint.body))")
        
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        
        guard let response = response as? HTTPURLResponse else {
            throw ServerError.error(code: 500, message: "Invalid Response")
        }
        
        let code = response.statusCode
        print("→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→ RESPONSE ←←←←←←←←←←←←←←←←←←←←←←←←←←←←←←")
        print(" 🚀 Status Code: \(code)")
        switch code {
            case 200...299:
                print(" 🚀 RESPONSE: 💣")
                
                #if !RELEASE
                print(String(data: data, encoding: .utf8) ?? "")
                #endif
                
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw ServerError.error(code: code, message: "Decode Error")
                }
                
                print(decodedResponse)
                return decodedResponse
            default:
                print("Código de error: \(code)")
                let error = ServerError.error(code: code, message: "Error \(code)")
                throw error
        }
    }
}
