//
//  AppsRowCell.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit
import SDWebImage

struct AppsRowViewModel {
    let nameLabelText: String
    let companyLabelText: String
    let imageURL: String
    
    init(dataModel: FeedResult) {
        self.nameLabelText = dataModel.name
        self.companyLabelText = dataModel.artistName
        self.imageURL = dataModel.artworkUrl100
    }
}

class AppsRowCell: UICollectionViewCell {
    static let identifer = "AppsRowCell"
    
    var feedResult: FeedResult! {
        didSet {
            nameLabel.text = feedResult.name
            companyLabel.text = feedResult.artistName
            imageView.sd_setImage(with: URL(string: feedResult.artworkUrl100))
        }
    }
    
    func setup(with viewModel: AppsRowViewModel) {
        nameLabel.text = viewModel.nameLabelText
        companyLabel.text = viewModel.companyLabelText
        imageView.sd_setImage(with: URL(string: viewModel.imageURL))
    }
    
    private let imageView = UIImageView(cornerRadius: 12)
    private let nameLabel = UILabel(font: .boldSystemFont(ofSize: 16))
    private let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    private let getButton = GetButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        let textStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        let mainStackView = UIStackView(arrangedSubviews: [imageView, textStackView, getButton])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        mainStackView.spacing = 16
        mainStackView.alignment = .center
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
