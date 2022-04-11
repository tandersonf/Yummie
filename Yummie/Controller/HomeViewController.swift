//
//  ViewController.swift
//  Yummie
//
//  Created by Cora on 11/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        self.view = HomeView()
    }

}

