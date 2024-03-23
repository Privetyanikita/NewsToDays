//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit

class BookmarksViewController: UIViewController {
    //MARK: - Private Properties
    
    ///Пока моковые данные
    private let sections = MockData.shared.pageData
    
    ///Массив для хранения ячеек, добавленных в закладки
    private var bookmarkedItems: [ListItem] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(BookmarksTableViewCell.self, forCellReuseIdentifier: "BookmarksTableViewCell")
        table.separatorStyle = .none
        return table
    }()
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    //MARK: - Private methods
    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
//MARK: - UITableViewDataSource
extension BookmarksViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0: ///"news" секция
            return sections[2].items.count
        case 1: ///"recommended" секция
            return sections[3].items.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BookmarksTableViewCell.self), for: indexPath) as? BookmarksTableViewCell else {
            return UITableViewCell()
        }
        
        ///Определение данных для отображения в ячейке в соответствии с секцией
        let item: ListItem
        switch indexPath.section {
        case 0: ///"news" секция
            item = sections[2].items[indexPath.row]
        case 1: ///"recommended" секция
            item = sections[3].items[indexPath.row]
        default:
            return UITableViewCell()
        }
        
        ///Прокидываем данные в ячейку
        cell.configureCell(image: item.image, newTopic: item.newsTopic, news: item.news)
        
        return cell
    }
    


}

//MARK: - UITableViewDelegate
extension BookmarksViewController: UITableViewDelegate {
    
    
}




