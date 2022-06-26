//
//  SearchCell.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

struct SearchCellViewModel {
    let nameLabelText: String
    let categoryLabelText: String
    let ratingsLabelText: Float?
    let appIconURL: String
    let screenshotURLs: [String]
    
    init(dataModel: ResultAPI) {
        self.nameLabelText = dataModel.trackName
        self.categoryLabelText = dataModel.primaryGenreName
        self.ratingsLabelText = dataModel.averageUserRating
        self.appIconURL = dataModel.artworkUrl100
        self.screenshotURLs = dataModel.screenshotUrls
    }
}

class SearchCell: UICollectionViewCell {
    static let identifer = "SearchCell"
    
    func setup(with viewModel: SearchCellViewModel) {
        nameLabel.text = viewModel.nameLabelText
        categoryLabel.text = viewModel.categoryLabelText
        ratingsLabel.text = String(format: "Rating: %.1f", viewModel.ratingsLabelText ?? 0)
        let url = URL(string: viewModel.appIconURL)
        appIconImageView.sd_setImage(with: url)
        firstScreensot.sd_setImage(with: URL(string: viewModel.screenshotURLs[0]))
        if viewModel.screenshotURLs.count>1 {
            secondScreensot.sd_setImage(with: URL(string: viewModel.screenshotURLs[1]))
        }
        if viewModel.screenshotURLs.count>2 {
            thirdScreensot.sd_setImage(with: URL(string: viewModel.screenshotURLs[2]))
        }
    }
    
    private let appIconImageView = AppIconImageView(type: .small)
    
    private let nameLabel = UILabel()
    private let categoryLabel = UILabel()
    private let ratingsLabel = UILabel()
    
    private let getButton: UIButton = GetButton()
    
    private var firstScreensot = ScreenshotImageView()
    private var secondScreensot = ScreenshotImageView()
    private var thirdScreensot = ScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        let screenshotsStackView = UIStackView(arrangedSubviews: [firstScreensot, secondScreensot, thirdScreensot])
        let mainStackView = UIStackView(arrangedSubviews: [infoStackView, screenshotsStackView])
        
        labelStackView.axis = .vertical
        
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
