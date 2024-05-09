//
//  DetailMovieView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct MovieDetailView: View {
    
    // MARK: - Public properties -
    
    public var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            ScrollView {
                Text(movie.title ?? "")
                    .font(TestFont(.extraBold).bodyLarge)
                VStack(spacing: 5) {
                    TestImageView(movie.poster_path ?? "")
                        .cornerRadius(20)
                        .shadow(radius: 6, x: 3, y: 3)
                    Text(movie.overview ?? "")
                        .font(TestFont(.light).bodyMedium)
                        .padding(.horizontal)
                    HStack {
                        Text(movie.release_date ?? "")
                        Spacer()
                        Text("Rating: \(String(movie.vote_average ?? 0))")
                    }.font(TestFont(.italic).bodySmall)
                    .padding(.horizontal)
                }
            }.multilineTextAlignment(.center)
            Button("LIKE") {
                self.isSuccessPresented = true
            }.buttonStyle(PrimaryButtonStyle())
        }.padding(Device.main.screen.widthPercent(3))
        .background(Color("green-seven"))
        .sheet(isPresented: $isSuccessPresented) {
                ModalView() {
                    SuccesModal(
                        img: "icon_success",
                        message: "Gracias por el like") {
                            self.isSuccessPresented = false
                        }
                }.presentationDetents([.height(Device.main.screen.scaledHeight(180))])
            }
    }
    
    // MARK: - Private properties -
    
    @Environment(\.dismiss) private var dismiss
    @State private var isSuccessPresented: Bool = false
    private let movie: MovieModel
    
    // MARK: - Lifecycle -
    
    public init(movie: MovieModel) {
        self.movie = movie
    }
}
