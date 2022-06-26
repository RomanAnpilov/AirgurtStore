//
//  AppsHeader.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

class AppsHeader: UICollectionReusableView {
    static let identifer = "AppsHeader"
    let horizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setupView()
    }
    
    private func setupView() {
        addSubview(horizontalController.view)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalController.view.topAnchor.constraint(equalTo: topAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
