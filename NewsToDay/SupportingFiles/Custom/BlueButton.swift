//
//  BlueButton.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 21.03.2024.
//

import UIKit

final class BlueButton: UIButton {
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private Methods

private extension BlueButton {
    
    func configure() {
        backgroundColor = .purplePrimary
        titleLabel?.font = Font.getFont(.medium, size: 16)
        tintColor = .white
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
    }
}
