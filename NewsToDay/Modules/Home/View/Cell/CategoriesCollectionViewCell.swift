//
//  CategoriesCollectionViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import SnapKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    //MARK: - Private Properties
    private let categoryLabel: UILabel = {
        let element = UILabel()
        element.layer.cornerRadius = 16
        element.layer.masksToBounds = true
        element.numberOfLines = 1
        element.textAlignment = .center
        element.backgroundColor = UIColor(named: "GreyLighter")
        element.font = Font.getFont(.regular, size: 12)
        element.textColor = UIColor(named: "GreyPrimary")
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
    func configureCell(topicName: String) {
        categoryLabel.text = topicName
    }
    
    private func setupView() {
        addSubview(categoryLabel)
    }
    
    private func setConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
    }
}

