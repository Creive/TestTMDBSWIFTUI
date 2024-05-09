//
//  Device.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import UIKit

public class Device {
    
    // MARK: - Public properties -
    
    static let main: Device = .init()
    
    public class Screen {
        private let referenceWidth: CGFloat = 360
        private let referenceHeight: CGFloat = 640
        
        public var width: CGFloat { UIScreen.main.bounds.width }
        public var height: CGFloat { UIScreen.main.bounds.height }
        
        public func scaledWidth(_ size: CGFloat) -> CGFloat { (size / referenceWidth) * width }
        public func scaledHeight(_ size: CGFloat) -> CGFloat { (size / referenceHeight) * height }
        public func widthPercent(_ percent: Double) -> CGFloat { width * percent / 100 }
        public func heightPercent(_ percent: Double) -> CGFloat { height * percent / 100 }
        
        fileprivate init() {}
    }
    
    public var screen: Screen
    
    // MARK: - Lifecycle -
    
    private init() { self.screen = .init() }
}
