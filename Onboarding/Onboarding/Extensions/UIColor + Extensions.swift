//
//  UIColor + Extensions.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

extension UIColor {
    
    enum OnboardingColors {
        static var blue: UIColor {
            return UIColor(named: "Blue-Onboarding-Color") ?? .red
        }
        
        static var orange: UIColor {
            return UIColor(named: "Orange-Onboarding-Color") ?? .red
        }
        
        static var purple: UIColor {
            return UIColor(named: "Purple-Onboarding-Color") ?? .red
        }
        
        static var yellow: UIColor {
            return UIColor(named: "Yellow-Onboarding-Color") ?? .red
        }
    }
}
