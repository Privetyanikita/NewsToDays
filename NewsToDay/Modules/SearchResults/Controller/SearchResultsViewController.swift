//
//  SearchResultsViewController.swift
//  NewsToDay
//
//  Created by Иван Семенов on 30.03.2024.
//

import UIKit
import SnapKit

class SearchResultsViewController: UIViewController {
    
    var searchResults: [News] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultTableViewCell")
        table.separatorStyle = .none
        return table
    }()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.tintColor = .purplePrimary
        setupViews()
        
    }
    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDataSource
extension SearchResultsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        let result = searchResults[indexPath.row]
        
        cell.configure(with: result)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNews = searchResults[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.configure(with: selectedNews)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
