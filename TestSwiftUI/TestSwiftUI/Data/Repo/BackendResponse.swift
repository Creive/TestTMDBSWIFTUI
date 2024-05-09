//
//  BackendResponse.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public struct BackendResponse<T: Decodable>: Decodable {
    
    // MARK: - Public properties -
    
    public let data: T?
    public let code: Int?
    public let error: String?
    
    public enum CodingKeys: String, CodingKey {
        case data = "Data"
        case code = "Code"
        case error = "Error"
    }
}
