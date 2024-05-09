//
//  EndPoint.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public struct Endpoint {
    
    // MARK: - Public properties -
    
    public var scheme: String {
        return "https"
    }
    
    public var host: String {
        return "https://api.themoviedb.org"
    }
    
    public var method: String {
        return "GET"
    }
    
    public var path: String
    
    public var body: [String: Any]?
}
