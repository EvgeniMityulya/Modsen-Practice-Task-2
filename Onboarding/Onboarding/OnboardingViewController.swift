//
//  ViewController.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    var currentPage = 0 {
        didSet {
//            self.updatePageControl()
        }
    }

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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OnboardingSlideCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingSlideCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingSlideCollectionViewCell.identifier, for: indexPath) as! OnboardingSlideCollectionViewCell
        let slide = self.slides[indexPath.row]
        cell.configure(with: slide)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        output?.slideCollectionViewInput(scrollView)
        print("End")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}


private extension OnboardingViewController {
    func setupUI() {
        self.view.addSubview(
            self.collectionView,
            self.navigationView
        )
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.navigationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 23),
            self.navigationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23),
            self.navigationView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            self.navigationView.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
//    func updateBackground(index: Int) {
//        switch index {
//        case 0:
//            self.view.backgroundColor = self.slides[0].color
//        case (slides.count - 1):
//            self.view.backgroundColor = self.slides[slides.count - 1].color
//        default:
//            self.view.backgroundColor = .clear
//        }
//        print(self.view.backgroundColor)
//        
//    }
//
//    func updatePageControl() {
//        self.pageControl.currentPage = self.currentPage
//        let buttonText = (self.currentPage == self.slides.count - 1) ? ButtonText.getStarted.rawValue : ButtonText.next.rawValue
//        self.nextButton.setTitle(buttonText, for: .normal)
//    }
}
