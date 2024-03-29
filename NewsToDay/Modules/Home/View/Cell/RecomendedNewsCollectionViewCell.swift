//
//  RecomendedNewsCollectionViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import Kingfisher
import SnapKit

final class RecomendedNewsCollectionViewCell: UICollectionViewCell {
    //MARK: - Private Properties
    lazy var cellImage: UIImageView = {
        let element = UIImageView()
        element.layer.cornerRadius = 12
        element.layer.masksToBounds = true
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    lazy var newsTopicLabel: UILabel = {
        let element = UILabel()
        element.font = Font.getFont(.regular, size: 14)
        element.textColor = UIColor(named: "GreyPrimary")
        element.numberOfLines = 1
        return element
    }()
    
    lazy var newsLabel: UILabel = {
        let element = UILabel()
        element.font = Font.getFont(.bold, size: 16)
        element.textColor = UIColor(named: "BlackPrimary")
        element.numberOfLines = 2
        return element
    }()
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
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: URL(string: image))  //UIImage(named: image)
        newsTopicLabel.text = newTopic
        newsLabel.text = news
    }

    private func setupView() {
        addSubview(cellImage)
        addSubview(newsTopicLabel)
        addSubview(newsLabel)
    }
    
    private func setConstraints() {
        cellImage.snp.makeConstraints { make in
            make.height.width.equalTo(96)
            make.leading.equalToSuperview()
        }
        
        newsTopicLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
            make.top.equalTo(cellImage.snp.top).offset(7)
            make.height.equalTo(20)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.top.equalTo(newsTopicLabel.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
        }
    }
}
