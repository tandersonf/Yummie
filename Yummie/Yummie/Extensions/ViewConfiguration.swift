//
//  ViewConfiguration.swift
//  Yummie
//
//  Created by Anderson Oliveira on 11/04/22.
//

import Foundation

protocol ViewConfiguration {
    func configViews()
    func buildViews()
    func setupConstraints()
    func setupViews()
}

extension ViewConfiguration {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}
