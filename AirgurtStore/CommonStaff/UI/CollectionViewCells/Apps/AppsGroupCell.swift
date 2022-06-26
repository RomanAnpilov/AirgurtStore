//
//  AppsGroupCell.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    static let identifer = "AppsGroupCell"
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureView()
    }
    
    private func configureView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        addSubview(horizontalController.view)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
