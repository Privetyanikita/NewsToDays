//
//  OnboardingViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    
    //MARK: - UI
    
    private let onboardingView = OnboardingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        onboardingView.delegate = self
    }
}


//MARK: - Private Methods

private extension OnboardingViewController {
    
    func setupViews() {
        view.addSubview(onboardingView)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            onboardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onboardingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            onboardingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}


//MARK: - OnboardingViewController Delegate

extension OnboardingViewController: OnboardingViewProtocol {
    func actionButtonPressed() {
        if UserDefaults.standard.bool(forKey: Constants.UserDefaults.onboarding) {
            let rootVC = TabBarController()
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        } else {
            let onboardingVC = OnboardingViewController()
            onboardingVC.modalPresentationStyle = .fullScreen
            onboardingVC.modalTransitionStyle = .crossDissolve
            present(onboardingVC, animated: true)
        }
    }
}
