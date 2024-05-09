//
//  AnimationViewComponent.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI
import Lottie

public struct AnimationViewComponent: UIViewRepresentable {
    
    // MARK: - Public properties -
    
    public typealias UIViewType = LottieAnimationView
    public let animationName: String
    
    // MARK: - Public methods -
    
    public func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: animationName)
        view.contentMode = .scaleAspectFit
        view.play(toProgress: 100, loopMode: .loop)
        return view
    }
    
    public func updateUIView(_ view: LottieAnimationView, context: Context) {}
}
