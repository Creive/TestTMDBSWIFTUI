//
//  GetMoviesUseCase.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import Foundation

public struct GetMoviesUseCase {
    
    // MARK: - Public  properties -
    
    let _moviesApi: ListMovieService
    
    init(api: ApiClient = TestApiClient()) {
        self._moviesApi = .init(api: api)
    }
    
    // MARK: - Public methods -
    public func execute() async throws -> (ListMovieModel) {
        return try await _moviesApi.request()
    }
}
