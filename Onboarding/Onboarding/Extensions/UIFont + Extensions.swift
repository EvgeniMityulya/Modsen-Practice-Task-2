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


extension UIFont {
    static func sfPro(ofSize size: CGFloat, style: SFProStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
    static func sfProText(ofSize size: CGFloat, style: SFProTextStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}

