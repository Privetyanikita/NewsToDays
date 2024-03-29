//
//  LoginViewController.swift
//  NewsToDay
//
//  Created by Kate Kashko on 27.03.2024.
//

import UIKit
import SnapKit
import SwiftUI

final class LoginViewController: UIViewController {
    
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
        element.text = "I am happy to see you again. You can continue where you left off by logging in"
        element.textColor = UIColor(named: "GreyDarker")
        element.numberOfLines = 0
        return element
    }()

    private let nameTF = CustomTextField(fieldType: .username)
    private let passwordTF = CustomTextField(fieldType: .password)

    private lazy var actionButton = BlueButton(text: "Sign In")
    
    private lazy var signInButton: UIButton = {
        let element = UIButton()
        element.setTitle("Don't have an account? Sign Up", for: .normal)
        element.setTitleColor(UIColor(named: "BlackLight"), for: .normal)
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome Back 👋"
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
        view.backgroundColor = .white
        view.addSubview(greeting)
        view.addSubview(mainStackView)
        view.addSubview(actionButton)
        view.addSubview(signInButton)
        
        mainStackView.addArrangedSubview(nameTF)
        mainStackView.addArrangedSubview(passwordTF)
        
    }
}

extension LoginViewController {
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
        passwordTF.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalTo(mainStackView)
        }
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.top.equalTo(mainStackView.snp.bottom).offset(64)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.centerX.equalToSuperview()
        }
    }
}


//MARK: - PreviewProvider
//struct ContentViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewController()
//            .edgesIgnoringSafeArea(.all)
//    }
//}
//struct ContentViewController: UIViewControllerRepresentable {
//    
//    typealias UIViewControllerType = LoginViewController
//    
//    func makeUIViewController(context: Context) -> UIViewControllerType {
//        return LoginViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {}
//}
