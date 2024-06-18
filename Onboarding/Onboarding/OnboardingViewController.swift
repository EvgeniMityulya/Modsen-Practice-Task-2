//
//  ViewController.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

final class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private var slides: [OnboardingSlide] = [
        OnboardingSlide(
            title: "Your first car without a driver's license",
            desciption: "Goes to meet people who just got their license",
            image: UIImage(named: Image.Onboarding.first)
        ),
        OnboardingSlide(
            title: "Always there: more than 1000 cars in Tbilisi",
            desciption: "Our company is a leader by the number of cars in the fleet",
            image: UIImage(named: Image.Onboarding.second)
        ),
        OnboardingSlide(
            title: "Do not pay for parking, maintenance and gasoline",
            desciption: "We will pay for you, all expenses related to the car",
            image: UIImage(named: Image.Onboarding.third)
        ),
        OnboardingSlide(
            title: "29 car models: from Skoda Octavia to Porsche 911",
            desciption: "Choose between regular car models or exclusive ones",
            image: UIImage(named: Image.Onboarding.fourth)
        )
    ]
}


private extension OnboardingViewController {
    func setupUI() {
    }
}
