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
    
    private var categoriesArray = [CategoriesModel]()
    
    
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
    
    
    func fillArray() -> [CategoriesModel] {
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.sportsCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.politicsCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.lifeCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.gamingCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.animalsCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.natureCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.foodCategory))
        categoriesArray.append(CategoriesModel(title: SelectCategoriesMockData.artCategory))
        
        return categoriesArray
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
