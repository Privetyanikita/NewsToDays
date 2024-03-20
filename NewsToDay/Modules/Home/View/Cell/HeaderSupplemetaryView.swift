//
//  HeaderSupplemetaryView.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import UIKit
import SnapKit

final class HeaderSupplemetaryView: UICollectionReusableView {
    //MARK: - Private Properties
    private let headerLabel: UILabel = {
        let element = UILabel()
        element.textColor = .black
        element.font = Font.getFont(.bold, size: 20)
        return element
    }()
    private lazy var seeAllButton: UIButton = {
        let element = UIButton()
        element.setTitle("See All", for: .normal)
        element.titleLabel?.font = Font.getFont(.regular, size: 14)
        element.setTitleColor(UIColor(named: "GreyPrimary"), for: .normal)
        element.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return element
    }()
    //MARK: - Action
    @objc private func actionButtonTapped() {
        print("See All")
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
    func configureHeader(labelName: String) {
        headerLabel.text = labelName
    }
    
    private func setupView() {
        addSubview(headerLabel)
        addSubview(seeAllButton)
    }
    
    private func setConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        seeAllButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
