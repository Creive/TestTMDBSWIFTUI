//
//  Buttons.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    // MARK: - Public properties -
    
    public func makeBody(configuration: Configuration) -> some View {
        PrimaryButton(configuration: configuration)
    }
}

fileprivate struct PrimaryButton: View {
    
    // MARK: - Private properties -
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled
    
    private let textColor = Color("green-nine")
    private let basicColorList = [Color("green-one"), Color("green-three")]
    private let disabledColor = Color("green-seven")
    private let disabledTextColor = Color("green-eight")
    private let shadowColor = Color("green-seven")
    
    private var state: TestButtonState {
        if !isEnabled { return .disabled }
        return configuration.isPressed ? .hover : .basic
    }
    
    fileprivate var body: some View {
        configuration.label
            .padding()
            .font(TestFont(.extraBold).bodyLarge)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(backgroundForState())
            .foregroundColor(foregroundColorForState())
            .clipShape(Capsule())
            .shadow(color: shadowColor, radius: 3, x: 0, y: 3)
    }
    
    // MARK: - Private methods -
    
    @ViewBuilder
    private func backgroundForState() -> some View {
        switch state {
        case .basic: LinearGradient(colors: basicColorList, startPoint: .leading, endPoint: .trailing)
        case .hover: LinearGradient(colors: basicColorList, startPoint: .leading, endPoint: .trailing)
        case .disabled: disabledColor
        }
    }
    
    private func foregroundColorForState() -> Color {
        switch state {
        case .basic, .hover: return textColor
        case .disabled: return disabledTextColor
        }
    }
}

fileprivate enum TestButtonState {
    case basic, hover, disabled
}
