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
    
    
    //MARK: - Properties
    
    private let news: [News]?
    private var titleForTitle = ""
    
    
    //MARK: - Lifecycle
    
    
    init (news: [News]?, title: String?) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
        self.titleForTitle = title ?? "General"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
        
        categoriesTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = titleForTitle
        categoriesTableView.arrayTransfer(news: news)
        categoriesTableView.reloadTableView()
    }
}


//MARK: - Delegate
extension CategoriesTableViewController: CategoriesTableViewProtocol {

    func presentDetailView() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}


private extension CategoriesTableViewController {
    
    func configure() {
        view.backgroundColor = .white
        view.addSubview(categoriesTableView)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
