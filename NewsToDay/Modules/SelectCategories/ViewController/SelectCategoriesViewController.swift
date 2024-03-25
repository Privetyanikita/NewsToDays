//
//  SelectCategoriesViewController.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho   on 25.03.2024.
//

import UIKit

final class SelectCategoriesViewController: UIViewController {
    
    
    //MARK: - UI
    
    private let selectCategoriesView = SelectCategoriesView()
    
    
    //MARK: - Properties
    
    private var favoriteTopicsArray = [CategoriesModel]()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
        selectCategoriesView.delegate = self
    }
}


//MARK: - SelectCategoriesViewDelegate

extension SelectCategoriesViewController: SelectCategoriesViewProtocol {
    
    func actionButtonPressed() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}


//MARK: - Private Methods

private extension SelectCategoriesViewController {
    
    func configure() {
        view.addSubview(selectCategoriesView)
        view.backgroundColor = .white
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            selectCategoriesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            selectCategoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectCategoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectCategoriesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
