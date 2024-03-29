//
//  CategoriesTableView.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 29.03.2024.
//

import UIKit

protocol CategoriesTableViewProtocol: AnyObject {
    func actionButtonPressed()
}


final class CategoriesTableView: UIView {
    
    //MARK: - UI

    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(BookmarksTableViewCell.self, forCellReuseIdentifier: "BookmarksTableViewCell")
        table.separatorStyle = .none
        return table
    }()
    
    
    //MARK: - Properties
    
    weak var delegate: CategoriesTableViewProtocol?
    private let network = NewsService()
    
    
    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension CategoriesTableView: UITableViewDelegate {
    
}


//MARK: - DataSource
extension CategoriesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as? BookmarksTableViewCell else { return UITableViewCell() }
        
        
        let item = BookmarkManager.shared.bookmarkedItems[indexPath.row]
        cell.configureCell(image: item.image, newTopic: item.newsTopic, news: item.news)
        
        return cell
    }
}


//MARK: - Private Methods

private extension CategoriesTableView {
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
    }
    
    
    func setConstraints() {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
    }
}
