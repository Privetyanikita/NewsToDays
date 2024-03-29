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

    
    //MARK: - Properties
    
    private let network = NewsService()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
        
        categoriesView.delegate = self
    }
}


//MARK: - Delegate
extension CategoriesViewController: CategoriesViewControllerProtocol {
    func fetchData(category: String) {
        network.fetchNews(forCategory: category) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                print("success")
                self.navigationController?.pushViewController(CategoriesTableViewController(), animated: true)
            case .failure(let failure):
                print("failure")
//                alert error or smth
            }
        }
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
