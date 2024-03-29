//
//  CustomTextField.swift
//  NewsToDay
//
//  Created by Kate Kashko on 28.03.2024.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case email
        case password
        case repeatPassword
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(named: "PurplePrimary")?.cgColor
        self.textColor = .black
        self.tintColor = UIColor(named: "PurplePrimary")
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "person"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 24)
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        case .email:
            self.placeholder = "Email Address"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "envelope"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 22)
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        case .password:
            self.placeholder = "Password"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "lock"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 24)
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        case .repeatPassword:
            self.placeholder = "Repeat password"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "lock"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 24)
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
