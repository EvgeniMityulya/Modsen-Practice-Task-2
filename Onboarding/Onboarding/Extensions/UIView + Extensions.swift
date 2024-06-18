//
//  UIView + Extensions.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
