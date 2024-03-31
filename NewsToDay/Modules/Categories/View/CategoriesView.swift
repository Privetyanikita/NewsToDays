//
//  CategoriesView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

protocol CategoriesViewControllerProtocol: AnyObject {
    func fetchData(category: String)
}


final class CategoriesView: UIView {
    
    //MARK: - UI
    
    private let descriptionCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Thousands of articles in each category"
        label.font = Font.getFont(.regular, size: 16)
        label.textColor = .greyPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoriesCVCell.self, forCellWithReuseIdentifier: CategoriesCVCell.idCell)
        return collectionView
    }()
    
    
    
    //MARK: - Properties
    
    private var categoriesArray = [CategoriesModel]()
    weak var delegate: CategoriesViewControllerProtocol?
    
    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setDelegates()
        setConstraints()
        
        temporaryAddArray()
    }
    
    
    convenience init(descriptionLabel text: String) {
        self.init(frame: .zero)
        
        descriptionCategoryLabel.text = text
        descriptionCategoryLabel.numberOfLines = 3
        configure()
        setDelegates()
        setConstraints()
        
        temporaryAddArray()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension CategoriesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell by index \(indexPath.item) was tapped")
        switch indexPath.item {
        case 0:
            delegate?.fetchData(category: Categories.business)
        case 1:
            delegate?.fetchData(category: Categories.entertainment)
        case 2:
            delegate?.fetchData(category: Categories.general)
        case 3:
            delegate?.fetchData(category: Categories.health)
        case 4:
            delegate?.fetchData(category: Categories.science)
        case 5:
            delegate?.fetchData(category: Categories.sports)
        case 6:
            delegate?.fetchData(category: Categories.technology)
        default: break
        }
    }
}


//MARK: - DelegateFlowLayout

extension CategoriesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2.1, height: collectionView.bounds.width / 5)
    }
}


//MARK: - DataSource

extension CategoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCVCell.idCell, for: indexPath) as? CategoriesCVCell else { return UICollectionViewCell() }
        
        let model = categoriesArray[indexPath.item]
        cell.cellConfigure(model: model)
        
        return cell
    }
}


//MARK: - Private Methods

private extension CategoriesView {
    
    func configure() {
        addSubview(descriptionCategoryLabel)
        addSubview(collectionView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            descriptionCategoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            descriptionCategoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionCategoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: descriptionCategoryLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func temporaryAddArray() {
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.sportsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.politicsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.lifeCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.gamingCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.animalsCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.natureCategory))
        categoriesArray.append(CategoriesModel(title: CategoriesMockData.foodCategory))
//        categoriesArray.append(CategoriesModel(title: CategoriesMockData.artCategory))
    }
}
