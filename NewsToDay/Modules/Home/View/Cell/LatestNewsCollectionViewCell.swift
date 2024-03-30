//
//  LatestNewsCollectionViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import SnapKit

final class LatestNewsCollectionViewCell: UICollectionViewCell {
    
    var bookMarkChangeColor: Bool = false
    
    //MARK: - Private Properties
    private let latestNewsImage: UIImageView = {
        let element = UIImageView()
        element.layer.cornerRadius = 12
        element.layer.masksToBounds = true
        element.contentMode = .scaleAspectFill
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
            bookMarkButton.setBackgroundImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            bookMarkButton.tintColor = .systemYellow
            bookMarkChangeColor = true
            //TODO: -
            
        } else {
            bookMarkButton.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
            bookMarkButton.tintColor = .white
            bookMarkChangeColor = false
            //TODO: -
            
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
        addSubview(bookMarkButton)
        addSubview(topicNewsLabel)
        addSubview(newsLabel)
    }
    
    private func setConstraints() {
        latestNewsImage.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
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

