//
//  CategoriesCVCell.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 25.03.2024.
//

import UIKit

final class CategoriesCVCell: UICollectionViewCell {
    
    
    //MARK: - UI
    
    private let backgroundCellView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.greyLighter.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let categoriesLabel = CustomLabel(numberOfLines: 2, textColor: .greyDarker, font: Font.getFont(.medium, size: 24))
    
    
    //MARK: - Properties
    
    static let idCell = "CategoriesCVCell"
    
    
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
        addSubview(backgroundCellView)
        addSubview(categoriesLabel)
    }
    
    
    func setConstraints() {
        backgroundCellView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        categoriesLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundCellView.snp.top).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(backgroundCellView.snp.bottom).offset(-24)
        }
    }
}
