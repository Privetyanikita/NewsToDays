//
//  CategoriesViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

final class CategoriesViewController: UIViewController {

    
    //MARK: - UI
    
    private let descriptionCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Thousands of articles in each category"
        label.font = Font.getFont(.regular, size: 16)
        label.textColor = .greyPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView = CategoriesCollectionView()

    
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
        view.addSubview(descriptionCategoryLabel)
        view.addSubview(collectionView)
        view.backgroundColor = .white
    }
    
        
    func setConstraints() {
        NSLayoutConstraint.activate([
            descriptionCategoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            descriptionCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionCategoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            
            collectionView.topAnchor.constraint(equalTo: descriptionCategoryLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
