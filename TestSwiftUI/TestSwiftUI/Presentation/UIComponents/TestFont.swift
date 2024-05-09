//
//  TestFont.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import SwiftUI

public enum FontTypes: String {
    case extraBold = "Inter-ExtraBold"
    case light = "Inter-Light"
    case italic = "Inter-Italic"
}

public struct TestFont {

    // MARK: - Public properties -
    
    public var displayLarge: Font {
         return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(57))
    }
    
    public var displayMedium: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(45))
    }
    
    public var displaySmall: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(36))
    }
    
    public var headlineLarge: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(32))
    }
    
    public var headlineMedium: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(28))
    }
    
    public var headlineSmall: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(24))
    }
    
    public var titleLarge: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(22))
    }
    
    public var titleMedium: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(20))
    }
    
    public var titleSmall: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(18))
    }
    
    public var labelLarge: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(11))
    }
    
    public var labelMedium: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(10))
    }
    
    public var labelSmall: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(9))
    }
    
    public var bodyLarge: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(16))
    }
    
    public var bodyMedium: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(14))
    }
    
    public var bodySmall: Font {
        return Font.custom(fontType.rawValue, size: Device.main.screen.scaledWidth(12))
    }
    
    // MARK: - Private properties -
    
    private let fontType: FontTypes
   
    // MARK: - Lifecycle -
    
    public init(_ fontType: FontTypes){
        self.fontType = fontType
    }
}
