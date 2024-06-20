//
//  OnboardingViewModel.swift
//  Onboarding
//
//  Created by Denis Haritonenko on 20.06.24.
//

import Foundation
import UIKit

class OnboardingViewModel {
    private var slides: [OnboardingSlide] = [
        OnboardingSlide(
            title: "Your first car without a driver's license",
            desciption: "Goes to meet people who just got their license",
            image: UIImage(named: Image.Onboarding.first),
            color: UIColor.OnboardingColors.yellow
        ),
        OnboardingSlide(
            title: "Always there: more than 1000 cars in Tbilisi",
            desciption: "Our company is a leader by the number of cars in the fleet",
            image: UIImage(named: Image.Onboarding.second),
            color: UIColor.OnboardingColors.purple
        ),
        OnboardingSlide(
            title: "Do not pay for parking, maintenance and gasoline",
            desciption: "We will pay for you, all expenses related to the car",
            image: UIImage(named: Image.Onboarding.third),
            color: UIColor.OnboardingColors.orange
        ),
        OnboardingSlide(
            title: "29 car models: from Skoda Octavia to Porsche 911",
            desciption: "Choose between regular car models or exclusive ones",
            image: UIImage(named: Image.Onboarding.fourth),
            color: UIColor.OnboardingColors.blue
        )
    ]

    var numberOfSlides: Int {
        return slides.count
    }

    func slide(at index: Int) -> OnboardingSlide? {
        guard index >= 0 && index < slides.count else { return nil }
        return slides[index]
    }
}
