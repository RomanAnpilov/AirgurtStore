//
//  AppsHeaderCell.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

struct AppsHeaderCellViewModel {
    let companyLabelText: String
    let titleLabelText: String
    let imageURL: String
    
    init(dataModel: SocialApp) {
        self.companyLabelText = dataModel.tagline
        self.titleLabelText = dataModel.name
        self.imageURL = dataModel.imageUrl
    }
}

class AppsHeaderCell: UICollectionViewCell {
    
    static let identifer = "AppsHeaderCell"
    
    private let companyLabel = UILabel(font: .boldSystemFont(ofSize: 12))
    private let titleLabel = UILabel(font: .systemFont(ofSize: 30))
    private let image = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setup(with viewModel: AppsHeaderCellViewModel) {
        companyLabel.text = viewModel.companyLabelText
        titleLabel.text = viewModel.titleLabelText
        image.sd_setImage(with: URL(string: viewModel.imageURL))
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, image])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        
        titleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
