//
//  CategoriesTableViewController.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 29.03.2024.
//

import UIKit


final class CategoriesTableViewController: UIViewController {
    
    
    //MARK: - UI
    
    private let categoriesTableView = CategoriesTableView()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        setConstraints()
    }
}


private extension CategoriesTableViewController {
    
    func configure() {
        view.backgroundColor = .white
        view.addSubview(categoriesTableView)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
