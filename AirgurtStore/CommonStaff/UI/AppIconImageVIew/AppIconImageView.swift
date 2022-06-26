//
//  AppIconImageView.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 26.06.2022.
//

import UIKit

enum IconViewType: Int {
    case small = 64
    case large = 140
}

class AppIconImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(type: IconViewType) {
        self.init(frame: .zero)
        backgroundColor = .red
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: CGFloat(type.rawValue)).isActive = true
        heightAnchor.constraint(equalToConstant: CGFloat(type.rawValue)).isActive = true
        layer.cornerRadius = CGFloat(type.rawValue / 6)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
