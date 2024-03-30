//
//  CategoriesTableView.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 29.03.2024.
//

import UIKit

protocol CategoriesTableViewProtocol: AnyObject {
    func presentDetailView()
}


final class CategoriesTableView: UIView {
    
    //MARK: - UI

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(BookmarksTableViewCell.self, forCellReuseIdentifier: "BookmarksTableViewCell")
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    //MARK: - Properties
    
    weak var delegate: CategoriesTableViewProtocol?
    private let network = NewsService()
    private var NewsTableData:[News]? = []
    
    
    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrayTransfer(news:[News]?){
        self.NewsTableData = news
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }
}


//MARK: - Delegate

extension CategoriesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.presentDetailView()
    }
}


//MARK: - DataSource
extension CategoriesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NewsTableData?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as? BookmarksTableViewCell, let NewsTableData = NewsTableData else { return UITableViewCell() }
        
        let item = NewsTableData[indexPath.row]
        cell.configureCell(image: item.urlToImage ?? "", newTopic: item.title ?? "", news: item.description ?? "")
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
//            NSLayoutConstraint.activate([
//                tableView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
//                tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//                tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//                tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
//            ])
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}
