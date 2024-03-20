//
//  TextFieldCollectionViewCell.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import SnapKit

final class TextFieldCollectionViewCell: UICollectionViewCell {
    //MARK: - Private Properties
    private let descriptionNewsLabel: UILabel = {
        let element = UILabel()
        element.text = "Discover things of this world"
        element.font = Font.getFont(.regular, size: 16)
        element.textColor = UIColor(named: "GreyPrimary")           
        return element
    }()

    private let mainView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: "GreyLighter")
        element.layer.cornerRadius = 12
        element.layer.masksToBounds = true
        return element
    }()
    
    private let searchButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        element.tintColor = UIColor(named: "GreyPrimary")
        return element
    }()
    
    private let searchTextField: UITextField = {
        let element = UITextField()
        element.placeholder = NSLocalizedString("Search", comment: "")
        element.backgroundColor = .clear
        element.textAlignment = .left
        element.font = Font.getFont(.regular, size: 16)
        element.autocapitalizationType = .words
        element.returnKeyType = .search
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
    private func setupView() {
        addSubview(descriptionNewsLabel)
        addSubview(mainView)
        mainView.addSubview(searchButton)
        mainView.addSubview(searchTextField)
    }
    
    private func setConstraints() {
        mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(descriptionNewsLabel.snp.bottom).offset(25)
            make.height.equalTo(56)
        }
        
        descriptionNewsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.leading.equalToSuperview()
            make.width.equalTo(50)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.height.trailing.equalToSuperview()
            make.leading.equalTo(searchButton.snp.trailing)
        }
    }
    
}
