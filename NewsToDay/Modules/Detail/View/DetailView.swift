//
//  DetailView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

extension UIButton {
    convenience init(systemImageName: String) {
        self.init(type: .system)
        setImage(UIImage(systemName: systemImageName), for: .normal)
        self.tintColor = .white
    }
}

extension UILabel {
    convenience init(text: String, 
                     font: UIFont? = UIFont(name: "Inter-SemiBold", size: 16),
                     color: UIColor
    ) {
        self.init()
        self.numberOfLines = 0
        self.text = text
        self.font = font
        self.textColor = color
    }
}

