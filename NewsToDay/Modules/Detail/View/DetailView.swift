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
