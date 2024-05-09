//
//  EndPoints.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public enum Endpoints : String {
    
    // MARK: - Public properties -
    
    case MovieTMDBApp = "3/movie/top_rated?api_key=6b3897fff44202e0d6d056f47d7616db&page=1"
    
    public func getUrl() -> String { return self.rawValue }
}
