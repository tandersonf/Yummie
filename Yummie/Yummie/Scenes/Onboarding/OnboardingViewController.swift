//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Anderson Oliveira on 11/04/22.
//

import Foundation
import UIKit

protocol OnboardingViewControllerDelegate {
    func goToNavViewController()
}

class OnboardingViewController: UIViewController, UICollectionViewDelegate, OnboardingViewControllerDelegate {
   
    var onboardingView = OnboardingView()

    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        self.view = onboardingView as UIView?
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        onboardingView.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToNavViewController() {
        print("Ten-Ten")
        let rootVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }

}
