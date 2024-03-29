//
//  LoginViewController.swift
//  NewsToDay
//
//  Created by Kate Kashko on 27.03.2024.
//

import UIKit
import SnapKit
import FirebaseAuth
import SwiftUI

final class LoginViewController: UIViewController {
    
    //MARK: - Private Properties
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
    
    private let nameTF = CustomTextField(fieldType: .email)
    private let passwordTF = CustomTextField(fieldType: .password)
    
    private lazy var actionButton = BlueButton(text: "Sign In")
    
    private lazy var signInButton: UIButton = {
        let element = UIButton()
        element.setTitle("Don't have an account? Sign Up", for: .normal)
        element.setTitleColor(UIColor(named: "BlackLight"), for: .normal)
        return element
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome Back 👋"
        setViews()
        setupConstraints()
        setupDelegates()
        addAction()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Private Methods
    private func addAction() {
        signInButton.addTarget(self, action: #selector(singUpTuppet), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(actionButtonTappet), for: .touchUpInside)
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
    
    private func setupDelegates(){
        nameTF.delegate = self
        passwordTF.delegate = self
    }
    
    private func singInAccount(){
        let email = nameTF.text
        let password = passwordTF.text
        if !email!.isEmpty && !password!.isEmpty{
            guard let email = email, let password = password else {return}
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.showErrorAlert(eror: error!.localizedDescription)
                    return
                }
                else {
                    let tabBarVC = SelectCategoriesViewController()
                    tabBarVC.modalPresentationStyle = .fullScreen
                    self.present(tabBarVC, animated: true)
                }
            }
        }
    }
    
    private func showErrorAlert(eror:String){
        let alert = UIAlertController(title: "Error", message: eror, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //MARK: - OBJC Private Func
    @objc private func actionButtonTappet() {
        print("button tapped")
        singInAccount()
    }
    
    @objc private func singUpTuppet(){
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

//MARK: - Setup Constraints
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

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        singInAccount()
        return true
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
