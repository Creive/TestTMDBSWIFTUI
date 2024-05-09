//
//  ProgressIndicator.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct ProgressIndicator: View {
    
    // MARK: - Public properties -
    
    public let color: Color
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                RotatingDotsIndicatorItemView(index: index, size: geometry.size, color: color)
            }
            .frame(width: geometry.size.width, height: geometry.size.height / 0.75)
        }
    }
    
    // MARK: - Private properties -
    
    private let count: Int = 5
}

public struct RotatingDotsIndicatorItemView: View {
    
    // MARK: - Public properties -
    
    public let index: Int
    public let size: CGSize
    public let color: Color
    
    public var body: some View {
        let animation = Animation
            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
            .repeatForever(autoreverses: false)
        
        return Circle()
            .frame(width: size.width / 20, height: size.height / 5)
            .scaleEffect(scale)
            .offset(y: size.width / 10 - size.height / 10)
            .rotationEffect(.degrees(rotation))
            .foregroundColor(color)
            .onAppear {
                rotation = 0
                scale = (5 - CGFloat(index)) / 5
                withAnimation(animation) {
                    rotation = 360
                    scale = (1 + CGFloat(index)) / 5
                }
            }
    }
    
    // MARK: - Private properties -
    
    @State private var scale: CGFloat = 0
    @State private var rotation: Double = 0
}
