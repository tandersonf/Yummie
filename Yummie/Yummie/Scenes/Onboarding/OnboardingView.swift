//
//  OnboardingView.swift
//  Yummie
//
//  Created byAnderson Oliveira on 11/04/22.
//

import Foundation
import UIKit

protocol OnboardingViewProtocol {
    func printCurrent(_ sender: UIButton)
    var delegate: OnboardingViewControllerDelegate? { get set }
}

class OnboardingView: UIView, ViewConfiguration, UIScrollViewDelegate, OnboardingViewProtocol {
    
    var delegate: OnboardingViewControllerDelegate?
    
    let deviceWidth = UIScreen.main.bounds.width
    var currentPage: Int = 0 {
        didSet {
            if currentPage == 2 {
                mainButton.setTitle("Get Started", for: .normal)
            } else {
                mainButton.setTitle("Harry Potter", for: .normal)
            }
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height - 200)
        scrollView.isUserInteractionEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .gray
        pageControl.allowsContinuousInteraction = false
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.addTarget(self, action: #selector(didPageControlChanged), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Harry Potter", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth  = 1
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(printCurrent), for: .touchUpInside)
        return button
        
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupScrollView()
        scrollView.delegate = self
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var slide1: OnboardingSlide = .init(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: "slide1")
    var slide2: OnboardingSlide = .init(title: "Your orders will be delivered", description: "Your orders will be delivered instantly irrespective of your location around the world", image: "slide2" )
    var slide3: OnboardingSlide = .init(title: "Delicious Dishes", description: "Experience a variety of amazin dishes from different cultures around the world", image: "slide3")
    
    
    func setupScrollView() {
        var viewTemplateInfos: [OnboardingSlide] = [
            slide1,slide2,slide3
        ]
        for numb in 0...2 {
            
            let cgRect: CGRect = CGRect(x: UIScreen.main.bounds.width * CGFloat(numb), y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
            
            scrollView.addSubview(OnboardingCollectionViewTemplate(frame: cgRect, image: viewTemplateInfos[numb].image, title: viewTemplateInfos[numb].title, description: viewTemplateInfos[numb].description))
        }
    }
    
    @objc func printCurrent(_ sender: UIButton) {
        if currentPage == 2  {
            delegate?.goToNavViewController()
        } else {
            pageControl.currentPage += 1
            didPageControlChanged(pageControl)
        }
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [scrollView,pageControl,mainButton].forEach(addSubview)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainButton.widthAnchor.constraint(equalToConstant: 150),
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
            
        ])
    }
    
    @objc func didPageControlChanged(_ sender: UIPageControl) {
        currentPage = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(currentPage) * deviceWidth , y: 0), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x)) / Float(deviceWidth) )
        currentPage = pageControl.currentPage
    }
}
