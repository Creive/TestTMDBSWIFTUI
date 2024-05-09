//
//  TestAppApi.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

public typealias ResponseListMovie = ListMovieEntity

public struct ListMovieService {
    
    // MARK: - Public properties -
    
    let api: ApiClient
    
    public func request() async throws -> (ListMovieModel) {
        let endpoint = Endpoint(path: Endpoints.MovieTMDBApp.getUrl())
        let response = try await self.api.sendRequest(endpoint: endpoint, responseModel: ResponseListMovie.self)
        
        return (response.convert())
    }
}

