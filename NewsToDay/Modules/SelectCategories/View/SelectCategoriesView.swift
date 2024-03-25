//
//  SelectCategoriesView.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 25.03.2024.
//

import UIKit

//MARK: - SelectCategoriesView Delegate

protocol SelectCategoriesViewProtocol: AnyObject {
    func actionButtonPressed()
    func fillArray() -> [CategoriesModel]
}


final class SelectCategoriesView: UIView {
    
    //MARK: - UI
    
    private let titleLabel = CustomLabel(text: SelectCategoriesMockData.titleLabel,
                                    alignment: .left,
                                    numberOfLines: 1,
                                    textColor: .blackPrimary,
                                    font: Font.getFont(.semibold, size: 24))

    
    private let descriptionCategoryLabel = CustomLabel(text: SelectCategoriesMockData.descriptionLabel,
                                                       alignment: .left,
                                                       numberOfLines: 2,
                                                       textColor: .greyPrimary,
                                                       font: Font.getFont(.regular, size: 16))
    
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoriesCVCell.self, forCellWithReuseIdentifier: CategoriesCVCell.idCell)
        return collectionView
    }()
    
    
    private lazy var nextButton = BlueButton(text: SelectCategoriesMockData.nextButton)
    
    
    //MARK: - Properties
    
    weak var delegate: SelectCategoriesViewProtocol?
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setupViews()
        setDelegates()
        setConstraints()
        
        nextButton.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension SelectCategoriesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell by index \(indexPath.item) was tapped")
    }
}


//MARK: - DelegateFlowLayout

extension SelectCategoriesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2.1, height: collectionView.bounds.width / 5)
    }
}


//MARK: - DataSource

extension SelectCategoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate?.fillArray().count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCVCell.idCell, for: indexPath) as? CategoriesCVCell else { return UICollectionViewCell() }
        
        guard let model = delegate?.fillArray()[indexPath.item] else { return UICollectionViewCell() }
        
        cell.backgroundColor = .greyLighter
        cell.cellConfigure(model: model)
        
        
        return cell
    }
}


//MARK: - Private Methods

private extension SelectCategoriesView {
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupViews() {
        let views = [titleLabel, descriptionCategoryLabel, collectionView, nextButton]
        views.forEach { addSubview($0) }
    }
    
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @objc func nextButtonDidTapped() {
        print("btton tapped")
        delegate?.actionButtonPressed()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            descriptionCategoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionCategoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionCategoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            collectionView.topAnchor.constraint(equalTo: descriptionCategoryLabel.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16),
            
            
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
