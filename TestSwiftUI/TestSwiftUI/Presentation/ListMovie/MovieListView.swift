//
//  MovieListView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 6/05/24.
//

import SwiftUI

public struct MovieListView: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var viewModel = MovieListViewModel(moviesModel: [])
    @State private var selectedMovie: MovieModel? = nil
    
    public var body: some View {
        LoadingView(loadingModel: viewModel.loadingModel) {
            VStack {
                Text("Top Movies")
                    .font(TestFont(.extraBold).bodyLarge)
                    .multilineTextAlignment(.center)
                List(viewModel.moviesModel, id: \.id) { movie in
                    HStack {
                        Text(movie.title ?? "")
                        Spacer()
                        Text(movie.release_date ?? "")
                    }.font(TestFont(.extraBold).bodyMedium)
                    .listRowBackground(Color("green-seven"))
                    TestImageView(movie.poster_path ?? "")
                    .onTapGesture {
                        selectedMovie = movie
                    }.listRowBackground(Color("green-eight"))
                    .listRowSeparatorTint(.white)
                }.clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10, x: 0, y: 3)
                .edgesIgnoringSafeArea(.bottom)
            }.fullScreenCover(item: $selectedMovie) { movie in
                MovieDetailView(movie: movie)
            }.onAppear {
                viewModel.fetchTopRatedMovies()
            }
        }.background(Color("green-three"))
    }
}
