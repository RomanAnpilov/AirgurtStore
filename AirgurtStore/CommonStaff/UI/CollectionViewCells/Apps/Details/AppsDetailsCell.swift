//
//  AppsDetailsCell.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import UIKit

class AppsDetailsCell: UICollectionViewCell {
    static let identifer = "AppsDetailsCell"
    
    let appIconImageView = AppIconImageView(type: .large)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24))
    let priceButton = UIButton(title: "$4.99")
    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    private func setupView() {
        let textStackView = UIStackView(arrangedSubviews: [nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]),UIView()])
        textStackView.spacing = 12
        textStackView.alignment = .top
        textStackView.axis = .vertical
        priceButton.backgroundColor = .systemBlue
        priceButton.layer.cornerRadius = 16
        priceButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let horizontalStackView = UIStackView(arrangedSubviews: [appIconImageView, textStackView])
        horizontalStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView, whatsNewLabel, releaseNotesLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
