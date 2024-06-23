//
//  UIStackView + Extensions.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
