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
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: self.frame.size.height))
        
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
            self.leftView = UIImageView(image: UIImage(systemName: "person"))
            self.leftView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            self.leftViewMode = .always
            
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            self.leftView = UIImageView(image: UIImage(systemName: "envelope"))
            self.leftView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            self.leftViewMode = .always
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            self.leftView = UIImageView(image: UIImage(systemName: "lock"))
            self.leftView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            self.leftViewMode = .always
            
        case .repeatPassword:
            self.placeholder = "Repeat password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            self.leftView = UIImageView(image: UIImage(systemName: "lock"))
            self.leftView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            self.leftViewMode = .always
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
