//
//  ListMovieEntity.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public struct ListMovieEntity: Decodable {
    
    // MARK: - Public properties -
    
    public let page: Int?
    public let listMovie: [MovieModel]
    
    public enum CodingKeys: String, CodingKey {
        case page
        case listMovie = "results"
    }
}

// MARK: - ListMovieEntity -

public extension ListMovieEntity {
    
    // MARK: - Public properties -
     func convert() -> ListMovieModel {
        return ListMovieModel(page: self.page ?? 0, results: self.listMovie)
    }
}
