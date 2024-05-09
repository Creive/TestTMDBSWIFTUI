//
//  ListMovieModel.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public struct ListMovieModel {
    
    // MARK: - Public properties -
    
    public let page: Int
    public let results: [MovieModel]?
}

public struct MovieModel: Identifiable, Decodable {
    
    // MARK: - Public properties -
    
    public let id: Int
    public let title: String?
    public let release_date: String?
    public let overview: String?
    public let poster_path: String?
    public let vote_average: Double?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case release_date
        case overview
        case poster_path
        case vote_average
    }
}
