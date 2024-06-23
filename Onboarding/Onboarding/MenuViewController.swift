//
//  MenuViewController.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/20/24.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You are a clever person!"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .anekMalayalam(ofSize: 24, style: .bold)
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.OnboardingColors.blue
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
