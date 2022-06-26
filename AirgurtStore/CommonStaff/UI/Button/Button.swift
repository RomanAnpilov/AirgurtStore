//
//  GetButton.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import UIKit

class GetButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(type: .system)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("GET", for: .normal)
        setTitleColor(.blue, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        widthAnchor.constraint(equalToConstant: 80).isActive = true
        heightAnchor.constraint(equalToConstant: 32).isActive = true
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
