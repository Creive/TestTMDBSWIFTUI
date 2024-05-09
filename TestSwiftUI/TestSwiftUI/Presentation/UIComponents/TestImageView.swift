//
//  TestImageView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct TestImageView: View {
    
    // MARK: - Public properties -
    public let imageName: String
    
    public var body: some View {
        if imageName.starts(with: "/") {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(imageName)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressIndicator(color: .blue)
            }
        } else {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    // MARK: - Public Lifecycle -
    
    public init(_ imageName: String) {
        self.imageName = imageName
    }
}
