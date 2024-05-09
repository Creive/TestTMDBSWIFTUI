//
//  TestBackgroundView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct TestBackgroundView: View {
    
    // MARK: - Public properties -
    
    public var body: some View {
        LinearGradient(
            colors: [startColor, endColor],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    // MARK: - Private properties -
    
    private let startColor: Color = Color("green-three")
    private let endColor: Color = Color("green-two")
}
