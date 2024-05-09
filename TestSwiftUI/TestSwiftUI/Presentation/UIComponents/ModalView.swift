//
//  ModalView.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public struct ModalView<Content:View>: View {
    let content: Content
    
    public var body: some View {
        ZStack (alignment: .bottom) {
            content
                .transition(.move(edge: .bottom))
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

public struct SuccesModal: View {
    
    // MARK: - Public properties -
    
    public let img: String
    public let message: String
    public let buttonLabel: LocalizedStringKey
    public let action: (() -> Void)?
    public let dismiss: Bool
    
    public var body: some View {
            VStack (alignment: .center, spacing: 24) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color("green-nine"))
                    .frame(width: 140, height: 4, alignment: .center)
                TestImageView(img)
                    .frame(maxHeight:122, alignment: .center)
                Text(message)
                    .font(TestFont(.extraBold).titleSmall)
                    .multilineTextAlignment(.center)
                Button(buttonLabel) {
                    action?()
                }.buttonStyle(PrimaryButtonStyle())
            }
            .padding(.vertical,30)
            .padding(.horizontal,30)
            .frame(maxWidth:.infinity)
            .background(Color("green-six"))
            .cornerRadius(10)
    }
    
    // MARK: - Lifecycle -
    
    public init(
        img: String,
        message: String,
        buttonLabel: LocalizedStringKey = "Continuar",
        dismiss: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.img = img
        self.message = message
        self.buttonLabel = buttonLabel
        self.action = action
        self.dismiss = dismiss
    }
}
