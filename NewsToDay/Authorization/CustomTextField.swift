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
            usernameImageView.contentMode = .scaleAspectFill
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        case .email:
            self.placeholder = "Email Address"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "envelope"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 22)
            usernameImageView.contentMode = .scaleAspectFill
            leftViewContainer.addSubview(usernameImageView)
            self.leftViewMode = .always
            
        case .password:
            self.placeholder = "Password"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "lock"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 24)
            usernameImageView.contentMode = .scaleAspectFill
            leftViewContainer.addSubview(usernameImageView)
            self.isSecureTextEntry = true
            self.leftViewMode = .always
            
            let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            let eyeButton = UIButton(type: .custom)
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
            eyeButton.frame = CGRect(x: 0, y: 10, width: 24, height: 24)
            eyeButton.contentMode = .scaleAspectFit
            eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
            rightViewContainer.addSubview(eyeButton)
            self.rightView = rightViewContainer
            self.rightViewMode = .always
            
        case .repeatPassword:
            self.placeholder = "Repeat password"
            self.leftView = leftViewContainer
            let usernameImageView = UIImageView(image: UIImage(systemName: "lock"))
            usernameImageView.frame = CGRect(x: 20, y: 20, width: 24, height: 24)
            usernameImageView.contentMode = .scaleAspectFill
            leftViewContainer.addSubview(usernameImageView)
            self.isSecureTextEntry = true
            self.leftViewMode = .always
            
            let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            let eyeButton = UIButton(type: .custom)
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
            eyeButton.frame = CGRect(x: 0, y: 10, width: 24, height: 24)
            eyeButton.contentMode = .scaleAspectFit
            eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
            rightViewContainer.addSubview(eyeButton)
            self.rightView = rightViewContainer
            self.rightViewMode = .always
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func eyeButtonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.2
        }) { (finished) in
            self.isSecureTextEntry = !self.isSecureTextEntry
            sender.isSelected = !sender.isSelected

            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
}
