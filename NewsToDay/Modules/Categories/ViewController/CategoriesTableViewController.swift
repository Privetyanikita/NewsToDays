//
//  CategoriesTableViewController.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 29.03.2024.
//

import UIKit


final class CategoriesTableViewController: UIViewController {
    
    
    //MARK: - UI
    
    private let titleLabel = CustomLabel(text: SelectCategoriesMockData.titleLabel,
                                    alignment: .left,
                                    numberOfLines: 1,
                                    textColor: .blackPrimary,
                                    font: Font.getFont(.semibold, size: 24))
    
    
    private let categoriesTableView = CategoriesTableView()
    
    
    //MARK: - Properties
    
    private let news: [News]?
    
    //MARK: - Lifecycle
    
    
    init (news: [News]?, title: String?) {
            self.news = news
            titleLabel.text = title
            super.init(nibName: nil, bundle: nil)
        }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        setConstraints()
    }
}


private extension CategoriesTableViewController {
    
    func configure() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(categoriesTableView)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
