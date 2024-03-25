//
//  CategoriesCollectionView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

final class CategoriesCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    private let flowLayout = UICollectionViewFlowLayout()
    private var categoriesArray = [CategoriesModel]()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        
        configure()
        configureFlowLayout()
        setDelegates()
        
        temporaryAddArray()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension CategoriesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell by index \(indexPath.item) was tapped")
    }
}


//MARK: - DelegateFlowLayout

extension CategoriesCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2.1, height: collectionView.bounds.width / 5)
    }
}


//MARK: - DataSource

extension CategoriesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CategoriesCVCell.idCell, for: indexPath) as? CategoriesCVCell else { return UICollectionViewCell() }
        
        let model = categoriesArray[indexPath.item]
        cell.cellConfigure(model: model)
        
        return cell
    }
}


//MARK: - Private Methods

private extension CategoriesCollectionView {
    
    func configureFlowLayout() {
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 16
    }
    
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        
        register(CategoriesCVCell.self, forCellWithReuseIdentifier: CategoriesCVCell.idCell)
    }
    
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    
    func temporaryAddArray() {
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.sportsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.politicsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.lifeCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.gamingCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.animalsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.natureCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.foodCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.artCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.historyCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.fashionCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.covid19Category))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.middleEastCategory))
    }
}
