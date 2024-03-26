//
//  CategoriesCVCell.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 25.03.2024.
//

import UIKit

final class CategoriesCVCell: UICollectionViewCell {
    
    
    //MARK: - UI
    
    private let categoriesLabel = CustomLabel(numberOfLines: 2, textColor: .greyDarker, font: Font.getFont(.medium, size: 24))
    
    
    //MARK: - Properties
    
    static let idCell = "CategoriesCVCell"
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .purplePrimary
                categoriesLabel.textColor = .white
            } else {
                backgroundColor = .greyLighter
                categoriesLabel.textColor = .greyDarker
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Public Methods

extension CategoriesCVCell {
    
    public func cellConfigure(model: CategoriesModel) {
        categoriesLabel.text = model.title
    }
}


//MARK: - Private Methods

private extension CategoriesCVCell {
    
    func configure() {
        backgroundColor = .greyLighter
        layer.borderWidth = 1
        layer.borderColor = UIColor.greyLighter.cgColor
        layer.cornerRadius = 12

        addSubview(categoriesLabel)
    }
    
    
    func setConstraints() {
        categoriesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
}
