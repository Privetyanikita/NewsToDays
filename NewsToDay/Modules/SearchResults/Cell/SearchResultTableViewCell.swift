//
//  SearchResultTableViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 30.03.2024.
//

import UIKit
import SnapKit

final class SearchResultTableViewCell: UITableViewCell {
    //MARK: - Private Properties
    private let cellImage: UIImageView = {
        let element = UIImageView()
        element.layer.cornerRadius = 12
        element.layer.masksToBounds = true
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private let newsTopicLabel: UILabel = {
        let element = UILabel()
        element.font = Font.getFont(.regular, size: 14)
        element.textColor = UIColor(named: "GreyPrimary")
        element.numberOfLines = 1
        return element
    }()
    
    private let newsLabel: UILabel = {
        let element = UILabel()
        element.font = Font.getFont(.bold, size: 16)
        element.textColor = UIColor(named: "BlackPrimary")
        element.numberOfLines = 2
        return element
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func configure(with news: News) {
        if let imageUrlString = news.urlToImage,
           let imageUrl = URL(string: imageUrlString) {
            cellImage.kf.setImage(with: imageUrl)
        } else {
            ///пустой image если nil
            cellImage.image = UIImage(named: "Rectangle7")
            // cellImage.isHidden = true
        }
        newsTopicLabel.text = news.title ?? ""
        newsLabel.text = news.description ?? ""
    }

    private func setupViews() {
        contentView.addSubview(cellImage)
        contentView.addSubview(newsTopicLabel)
        contentView.addSubview(newsLabel)
    }
    
    private func setConstraints() {
        cellImage.snp.makeConstraints { make in
            make.height.width.equalTo(96)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        newsTopicLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(cellImage.snp.top).offset(7)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(newsTopicLabel.snp.bottom).offset(8)
            make.bottom.lessThanOrEqualToSuperview().offset(-8)
        }
    }
}
