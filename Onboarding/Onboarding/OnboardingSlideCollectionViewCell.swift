//
//  OnboardingSlideCollectionViewCell.swift
//  Onboarding
//
//  Created by Евгений Митюля on 6/18/24.
//

import UIKit

final class OnboardingSlideCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingViewController.self)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 38
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var slideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.zPosition = 2
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.font = .sfProText(ofSize: 24, style: .bold)
        return label
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.font = .sfPro(ofSize: 19, style: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with slide: OnboardingSlide) {
        DispatchQueue.main.async {
            self.slideImageView.image = slide.image
            self.titleLabel.text = slide.title
            self.descriptionLabel.text = slide.desciption
            self.contentView.backgroundColor = slide.color
        }
    }
}

private extension OnboardingSlideCollectionViewCell {
    func setupUI() {
        self.contentView.addSubview(
            self.stackView
        )
        
        self.stackView.addArrangedSubview(
            self.textStackView,
            self.slideImageView
        )
        
        self.textStackView.addArrangedSubview(
            self.titleLabel,
            self.descriptionLabel
        )
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 35),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -103),
            
            self.textStackView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 24),
            self.textStackView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -24),
            
            self.slideImageView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.slideImageView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
        ])
    }
}
