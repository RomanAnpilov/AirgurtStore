//
//  ScreenshotImageView.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 26.06.2022.
//

import UIKit

class ScreenshotImageView: UIImageView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .blue
        layer.cornerRadius = 8
        clipsToBounds = true
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
