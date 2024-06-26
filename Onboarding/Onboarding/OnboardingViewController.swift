//
//  ViewController.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private var model = OnboardingModel()
    
    var currentPage = 0 {
        didSet {
            self.updateCollectionViewPages()
            self.updatePageControlAndProgressBar()
            self.isLastSlide()
        }
    }
        
    // Drawing stuff
    private var widthAnchor: NSLayoutConstraint?
    private var currentPageMultiplier: CGFloat = 0
    private let shape = CAShapeLayer()
    private var previousAnimationValue: CGFloat  = 0
    
    private var pageIndicators: [UIView] = []
    
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
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(OnboardingSlideCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingSlideCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pageControlStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for tag in 1...model.numberOfSlides {
            let pageIndicator = UIView()
            pageIndicator.tag = tag
            pageIndicator.translatesAutoresizingMaskIntoConstraints = false
            pageIndicator.backgroundColor = .white
            pageIndicator.layer.cornerRadius = 4
            self.pageIndicators.append(pageIndicator)
            stackView.addArrangedSubview(pageIndicator)
        }
        return stackView
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .abel(ofSize: 18, style: .regular)
        button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButtonView: UIView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right.circle.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextSlide))
        
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 58).isActive = true
        view.heightAnchor.constraint(equalToConstant: 58).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setShape()
        self.updatePageControlAndProgressBar()
    }
    
    @objc func nextSlide() {
        let maxSlide = model.numberOfSlides
        if currentPage < maxSlide - 1 {
            currentPage += 1
            print("next")
            print("current page is \(currentPage)")
        } else if currentPage == maxSlide - 1 {
            print("last")
                let vc = MenuViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    @objc func skip() {
        self.currentPage = model.numberOfSlides - 1
        self.collectionView.scrollToItem(at: IndexPath(item: self.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.numberOfSlides
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingSlideCollectionViewCell.identifier, for: indexPath) as! OnboardingSlideCollectionViewCell
        if let slide = model.slide(at: indexPath.row) {
            cell.configure(with: slide)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        self.currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    func updateCollectionViewPages() {
        let indexPath = IndexPath(item: self.currentPage, section: 0)
        
        // MARK: - ERROR
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print(indexPath)
    }
    
    func isLastSlide() {
        if self.currentPage == model.numberOfSlides - 1 {
            UserDefaultsManager.shared.save(true, forKey: UserDefaultsKey.isOnboardingComplete)
        }
    }
}


private extension OnboardingViewController {
    private func setShape() {
        currentPageMultiplier = CGFloat(1) / CGFloat(model.numberOfSlides)
        
        let nextStroke = UIBezierPath(arcCenter: CGPoint(x: 29, y: 29), radius: 28, startAngle: -(.pi/2), endAngle: (.pi * 3)/2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = nextStroke.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 3
        trackShape.strokeColor = UIColor.white.cgColor
        trackShape.opacity = 0.4
        nextButtonView.layer.addSublayer(trackShape)
        
        shape.path = nextStroke.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.white.cgColor
        shape.lineWidth = 3
        shape.lineCap = .round
        shape.strokeStart = 0
        shape.strokeEnd = 0
        
        nextButtonView.layer.addSublayer(shape)
    }
    
    func updatePageControlAndProgressBar() {
        let currentIndicator = currentPage + 1
        pageIndicators.forEach { pageIndicator in
            let tag = pageIndicator.tag
            
            pageIndicator.constraints.forEach { constraint in
                pageIndicator.removeConstraint(constraint)
            }
            
            if currentIndicator == tag {
                pageIndicator.layer.opacity = 1
                widthAnchor = pageIndicator.widthAnchor.constraint(equalToConstant: 24)
            } else {
                pageIndicator.layer.opacity = 0.5
                widthAnchor = pageIndicator.widthAnchor.constraint(equalToConstant: 8)
            }
            widthAnchor?.isActive = true
            pageIndicator.heightAnchor.constraint(equalToConstant: 8).isActive = true
        }
        
        let currentIndex = currentPageMultiplier * CGFloat(currentIndicator)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = previousAnimationValue
        animation.toValue = currentIndex
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.duration = 0.5
        shape.add(animation, forKey: "animation")
        
        previousAnimationValue = currentIndex
    }
}


private extension OnboardingViewController {
    func setupUI() {
        self.view.addSubview(
            self.collectionView,
            self.navigationView
        )
        
        self.navigationView.addSubview(
            self.pageControlStack,
            self.skipButton,
            self.nextButtonView
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
            
            self.skipButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            self.skipButton.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor),
            self.skipButton.heightAnchor.constraint(equalToConstant: 24),
            
            self.pageControlStack.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 10),
            self.pageControlStack.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            
            self.nextButtonView.topAnchor.constraint(equalTo: navigationView.topAnchor),
            self.nextButtonView.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor),
            self.nextButtonView.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor),
        ])
    }
}
