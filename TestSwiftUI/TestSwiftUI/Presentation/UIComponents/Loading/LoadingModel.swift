//
//  LoadingModel.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import Foundation

@MainActor public class LoadingModel: ObservableObject {
    
    // MARK: - Public properties -
    
    @Published private(set) var loading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var screenType: ScreenType
    @Published var networkError: Bool = false
    @Published var serverError: Bool = false
    @Published var errorHandler: () -> Void = {}
    
    public var animation: String {
        switch screenType {
        case .loadMovies:
            return "AnimatedCoin"
        }
    }
    
    public enum ScreenType {
        case loadMovies
    }
    
    // MARK: - Private properties -
    
    private let dismissHandler: () -> Void
    
    // MARK: - Lifecycle -
    
    public init(screenType: ScreenType = .loadMovies, dismissHandler: @escaping () -> Void = {}) {
        self.screenType = screenType
        self.dismissHandler = dismissHandler
    }
    
    // MARK: - Public methods -
    
    public func startLoading(handler: @escaping (Bool) -> Void) {
        loading = true
        if !InternetConnection.isConnected {
            self._error { handler(false) }
        } else {
            handler(true)
        }
    }
    
    public func response(error: Error) {
        guard error is ServerError else {
            serverError = true
            return
        }
    }
    
    public func startLoading(handler: @escaping () -> Void = {}) {
        loading = true
        if !InternetConnection.isConnected {
            self._error()
        } else {
            handler()
        }
    }
    
    public func startLoading() async -> Bool {
        loading = true
        let isConnected = InternetConnection.isConnected
        if !isConnected { self._error() }
        return isConnected
    }
    
    public func stopLoading() {
        self.loading = false
    }
    
    // MARK: - Private methods -
    
    private func _error(_ handler: @escaping () -> Void = {}) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.loading = false
            self.networkError = true
            self.errorHandler = {
                self.dismissHandler()
                handler()
            }
        }
    }
}
