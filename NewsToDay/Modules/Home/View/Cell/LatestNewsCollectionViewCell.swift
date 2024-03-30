//
//  LatestNewsCollectionViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class LatestNewsCollectionViewCell: UICollectionViewCell {
    
    var bookMarkChangeColor: Bool = false
//    private var newsItem: ListItem?
    weak var delegate: BookmarkDelegate?
    
    //MARK: - Private Properties
    private let latestNewsImage: UIImageView = {
        let element = UIImageView()
        element.layer.cornerRadius = 12
        element.layer.masksToBounds = true
        element.backgroundColor = .red
        element.contentMode = .scaleAspectFill
        return element
    }()
    private lazy var colorView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.4)
        return element
    }()
    
    private let topicNewsLabel: UILabel = {
        let element = UILabel()
        element.textColor = UIColor(named: "GreyLighter")
        element.font = Font.getFont(.regular, size: 12)
        element.textAlignment = .left
        element.backgroundColor = .clear
        return element
    }()
    
    private let newsLabel: UILabel = {
        let element = UILabel()
        element.textColor = .white
        element.font = Font.getFont(.bold, size: 16)
        element.numberOfLines = 0
        element.textAlignment = .left
        element.backgroundColor = .clear
        return element
    }()
    
    private lazy var bookMarkButton: UIButton = {
        let element = UIButton()
        element.tintColor = .white
        element.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
        element.addTarget(self, action: #selector(addToBookmarks), for: .touchUpInside)
        return element
    }()
    // MARK: - Action
    @objc private func addToBookmarks() {
        if bookMarkChangeColor == false {
//            guard let newsItem = newsItem else { return }
            bookMarkButton.setBackgroundImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            bookMarkButton.tintColor = .systemYellow
            bookMarkChangeColor = true
//            delegate?.addToBookmarks(news: newsItem)
            print("добавлена")
        } else {
//            guard let newsItem = newsItem else { return }
            bookMarkButton.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
            bookMarkButton.tintColor = .white
            bookMarkChangeColor = false
            
//            ///поиск индекса элемента в массиве закладок
//            if let index = BookmarkManager.shared.bookmarkedItems.firstIndex(of: newsItem) {
//                BookmarkManager.shared.removeBookmark(at: index)
//            }
            print("снята")
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func configureCell(image: String, newTopic: String, news: String) {
//        self.newsItem = newsItem
        latestNewsImage.kf.indicatorType = .activity
        latestNewsImage.kf.setImage(with: URL(string: image))   
        topicNewsLabel.text = newTopic
        newsLabel.text = news
    }
    
    private func setupView() {
        addSubview(latestNewsImage)
        latestNewsImage.addSubview(colorView)
        addSubview(bookMarkButton)
        addSubview(topicNewsLabel)
        addSubview(newsLabel)
    }
    
    private func setConstraints() {
        latestNewsImage.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        colorView.snp.makeConstraints { make in
            make.edges.equalTo(latestNewsImage)
        }
        
        bookMarkButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.trailing.equalToSuperview().inset(24)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.width.equalTo(208)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
        }
        
        topicNewsLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalTo(newsLabel.snp.top).offset(-8)
        }
    }
}
//MARK: - затемнение
extension UIImageView {
    func toner() {
        self.inputView?.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.4)
    }
}
