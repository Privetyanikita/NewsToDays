//
//  CategoriesViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

final class CategoriesViewController: UIViewController {

    
    //MARK: - UI
    
    private let categoriesView = CategoriesView()

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
    }
}


//MARK: - Private Methods

private extension CategoriesViewController {
    
    func configure() {
        view.addSubview(categoriesView)
        view.backgroundColor = .white
    }
    
        
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoriesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            categoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
