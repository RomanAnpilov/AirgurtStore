//
//  UILabel + Extension.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
