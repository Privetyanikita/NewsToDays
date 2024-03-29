//
//  CustomLabel.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 22.03.2024.
//

import UIKit

final class CustomLabel: UILabel {
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    
    convenience init(text: String = "",
                     alignment: NSTextAlignment = .center,
                     numberOfLines: Int = 2,
                     textColor: UIColor = .greyPrimary,
                     font: UIFont = Font.getFont(.medium, size: 16)) {
        self.init(frame: .zero)
        
        configure(title: text,
                  alignment: alignment,
                  numberOfLines: numberOfLines,
                  textColor: textColor,
                  font: font)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private Methods

private extension CustomLabel {
    
    func configure(title: String, alignment: NSTextAlignment, numberOfLines: Int, textColor: UIColor, font: UIFont) {
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.font = font
        text = title
        textAlignment = alignment
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}

