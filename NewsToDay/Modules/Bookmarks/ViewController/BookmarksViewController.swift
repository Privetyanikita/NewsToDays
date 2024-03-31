//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit
import FirebaseAuth

class BookmarksViewController: UIViewController {
    //MARK: - Private Properties
    
    ///Пока моковые данные
    private let sections = MockData.shared.pageData
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(BookmarksTableViewCell.self, forCellReuseIdentifier: "BookmarksTableViewCell")
        table.separatorStyle = .none
        return table
    }()
    
    private let noBookmarksView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let bookImage = UIImageView(image: UIImage(systemName: "text.book.closed"))
        bookImage.tintColor = .purplePrimary
        bookImage.contentMode = .scaleAspectFit
        
        let imageViewContainer = UIView()
        imageViewContainer.addSubview(bookImage)
        bookImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(24)
        }
        
        let messageLabel = UILabel()
        messageLabel.text = "You haven't saved any articles \n yet. Start reading and \n bookmarking them now"
        messageLabel.textColor = .blackPrimary
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        let circleView = UIView()
        circleView.backgroundColor = .greyLighter
        circleView.layer.cornerRadius = 36
        
        view.addSubview(circleView)
        view.addSubview(messageLabel)
        view.addSubview(imageViewContainer)
        
        circleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-56)
            make.size.equalTo(72)
        }
        
        imageViewContainer.snp.makeConstraints { make in
            make.center.equalTo(circleView.snp.center)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(circleView.snp.bottom).offset(16)
        }
        
        return view
    }()
    
    private var bookmarks: [NewsModelDatabase] = []
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBookmarksVisibility()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBookmarks()
        updateBookmarksVisibility()
        
    }
    
    //MARK: - Methods
    func updateBookmarks() {
        tableView.reloadData()
    }
    
    private func updateBookmarksVisibility() {
        if bookmarks.isEmpty {
            tableView.isHidden = true
            view.addSubview(noBookmarksView)
            noBookmarksView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        } else {
            tableView.isHidden = false
            noBookmarksView.removeFromSuperview()
            setupViews()
            tableView.reloadData()
        }
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func fetchBookmarks() {
        guard let currentUser = Auth.auth().currentUser else {
            print("Текущий пользователь не найден")
            return
        }
        
        FirebaseManager.shared.fetchBookmarks { bookmarks in
            if let bookmarks = bookmarks {
                for bookmark in bookmarks {
                    self.bookmarks.append(bookmark)
                }
            } else {
                print("Failed to fetch bookmarks or no bookmarks available.")
            }
        }
    }
    
}
//MARK: - UITableViewDataSource
extension BookmarksViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BookmarksTableViewCell.self), for: indexPath) as? BookmarksTableViewCell else {
            return UITableViewCell()
        }
        
        let item = bookmarks[indexPath.row]
        cell.configureCell(image: item.urlToImage ?? "", newTopic: item.title ?? "", news: item.description ?? "")
        return cell
    }
}


//MARK: - UITableViewDelegate
extension BookmarksViewController: UITableViewDelegate {
    
    
}




