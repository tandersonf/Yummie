//
//  File.swift
//  Yummie
//
//  Created by Anderson Oliveira on 11/04/22.
//

import Foundation
import UIKit

protocol HomeViewProtocol {
    
}

class HomeView: UIView, ViewConfiguration, HomeViewProtocol {
    
    
    func configViews() {
        backgroundColor = .blue
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
