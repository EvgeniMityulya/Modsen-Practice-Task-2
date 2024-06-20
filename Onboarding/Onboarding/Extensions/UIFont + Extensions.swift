//
//  UIFont + Extensions.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

enum SFProStyle: String {
    case regular = "SFPro-Regular"
}

enum SFProTextStyle: String {
    case bold = "SFProText-Bold"
}

enum abelStyle: String {
    case regular = "Abel-Regular"
}

enum anekMalayalamStyle: String {
    case bold = "AnekMalayalam-Bold"
}


extension UIFont {
    static func sfPro(ofSize size: CGFloat, style: SFProStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
    static func sfProText(ofSize size: CGFloat, style: SFProTextStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
    static func abel(ofSize size: CGFloat, style: abelStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }

    static func anekMalayalam(ofSize size: CGFloat, style: anekMalayalamStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
