//
//  MovieListViewModel.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import Foundation

@MainActor public class MovieListViewModel: ObservableObject {
    
    // MARK: - Public properties -
    
    let getMoviesUseCase: GetMoviesUseCase
    @Published var moviesModel: [MovieModel]
    @Published var loadingModel: LoadingModel = .init(screenType: .loadMovies)
    
    // MARK: - Lifecycle -
    
    init(
        getMoviesUseCase: GetMoviesUseCase = GetMoviesUseCase(api: TestApiClient()),
        moviesModel: [MovieModel]
    ){
        self.getMoviesUseCase = getMoviesUseCase
        self.moviesModel = moviesModel
    }
    
    // MARK: - Public methods -
    
    public func fetchTopRatedMovies() {
        loadingModel.startLoading {
            Task(priority: .background) {
                do {
                    let (data) = try await self.getMoviesUseCase.execute()
                    self.moviesModel = data.results ?? []
                } catch {
                    print(error.localizedDescription)
                }
                self.loadingModel.stopLoading()
            }
        }
    }
}
