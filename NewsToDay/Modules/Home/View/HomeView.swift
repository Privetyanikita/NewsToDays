//
//  HomeView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

class HomeView {
    
    lazy var collectionView: UICollectionView = {
        let collectViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectViewLayout)
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
}
