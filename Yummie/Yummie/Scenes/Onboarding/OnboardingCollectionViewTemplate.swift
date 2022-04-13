//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Anderson Oliveira on 11/04/22.
//

import UIKit

class OnboardingCollectionViewTemplate: UIView, ViewConfiguration {
    
    var imageNumber: String?
    var titleText: String?
    var mainText: String?
    
    lazy var imagez: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: imageNumber ?? "slide1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .purple
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = titleText ?? "Title"
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var textLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.textAlignment = .center
        text.text = mainText ?? "Lorem Ipsum Solum Dolor,Lorem Ipsum Solum Dolor, Lorem Ipsum Solum Dolor, Lorem Ipsum Solum Dolor, Lorem Ipsum Solum Dolor"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    init(frame: CGRect, image: String, title: String, description: String){
        super.init(frame: frame)
        setupViews()
        imagez.image = UIImage(named: "\(image)")
        textLabel.text = description
        titleLabel.text = title
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        
    }
    
    func buildViews() {
        [imagez,titleLabel,textLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imagez.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            imagez.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imagez.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            imagez.heightAnchor.constraint(equalToConstant: 300),
            
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -24),
        ])
    }
}
