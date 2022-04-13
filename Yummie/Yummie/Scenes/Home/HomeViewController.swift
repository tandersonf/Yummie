//
//  ViewController.swift
//  Yummie
//
//  Created by Anderson Oliveira on 11/04/22.
//

import UIKit

protocol HomeViewControllerProtocol {
    
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        self.view = HomeView()
    }
    
    func goToNavViewController() {
        let rootVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
}

