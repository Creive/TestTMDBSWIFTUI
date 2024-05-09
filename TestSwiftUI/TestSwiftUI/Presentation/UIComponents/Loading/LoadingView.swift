//
//  LoadingView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct LoadingView<Content: View>: View {
    
    // MARK: - Public properties -
    
    @ObservedObject var loadingModel: LoadingModel
    var content: Content
    public var body: some View {
        ZStack {
            content
            if loadingModel.loading {
                ZStack {
                    AnimationViewComponent(animationName: loadingModel.animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }.background(TestBackgroundView().ignoresSafeArea())
            }
        }
    }
    
    // MARK: - Lifecycle -
    
    public init(
        loadingModel: LoadingModel,
        @ViewBuilder content: () -> Content
    ) {
        self.loadingModel = loadingModel
        self.content = content()
    }
}
