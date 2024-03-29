//
//  RegisterViewController.swift
//  NewsToDay
//
//  Created by Kate Kashko on 28.03.2024.
//

import UIKit
import SnapKit
import SwiftUI

final class RegisterViewController: UIViewController {
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .center
        element.distribution = .fill
        element.spacing = 16
        return element
    }()
    
    private lazy var greeting: UILabel = {
        let element = UILabel()
        element.text = "Hello, I guess you are new around here. You can start using the application after sign up."
        element.textColor = UIColor(named: "GreyDarker")
        element.numberOfLines = 0
        return element
    }()

    private let nameTF = CustomTextField(fieldType: .username)
    private let emailTF = CustomTextField(fieldType: .email)
    private let passwordTF = CustomTextField(fieldType: .password)
    private let repeatPasswordTF = CustomTextField(fieldType: .repeatPassword)

    private lazy var actionButton = BlueButton(text: "Sign Up")
    
    private lazy var signInButton: UIButton = {
        let element = UIButton()
        element.setTitle("Already have an account? Sign In", for: .normal)
        element.setTitleColor(UIColor(named: "BlackLight"), for: .normal)
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome to NewsToDay"
        addAction()
        setViews()
        addAction()
        setupConstraints()
    }
    
    private func addAction() {
    }
    
    @objc private func actionButtonTappet() {
        print("button tapped")
    }
    
    private func setViews() {
        view.addSubview(greeting)
        view.addSubview(mainStackView)
        view.addSubview(signInButton)
        
        mainStackView.addArrangedSubview(nameTF)
        mainStackView.addArrangedSubview(emailTF)
        mainStackView.addArrangedSubview(passwordTF)
        mainStackView.addArrangedSubview(repeatPasswordTF)
        mainStackView.addArrangedSubview(actionButton)
        
    }
}

extension RegisterViewController {
    private func setupConstraints() {
        
        greeting.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(greeting.snp.bottom).offset(32)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        nameTF.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        emailTF.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        passwordTF.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        repeatPasswordTF.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.centerX.equalToSuperview()
        }
    }
}

struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewController()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = RegisterViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return RegisterViewController()
    }
    
    func updateUIViewController(_ uiViewController: RegisterViewController, context: Context) {}
}
