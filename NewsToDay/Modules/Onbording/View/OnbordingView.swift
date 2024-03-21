//
//  OnbordingView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

//MARK: - OnboardingVC Delegate
protocol OnboardingViewProtocol: AnyObject {
    func actionButtonPressed()
}


final class OnboardingView: UIView {
    
    
    //MARK: - UI
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.getFont(.bold, size: 24)
        label.text = "First to know"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "All news in one place, be first to know last news"
        label.font = Font.getFont(.medium, size: 16)
        label.textColor = .greyPrimary
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var actionButton = BlueButton(text: "Next")
    
    
    //MARK: - Properties
    
    private var collectionItem = 0
    private var onboardingArray = [OnboardingModel]()
    weak var delegate: OnboardingViewProtocol?
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width,
               height: collectionView.frame.height)
    }
}


//MARK: - UICollectionViewDataSource

extension OnboardingView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.idOnboardingCell, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        let model = onboardingArray[indexPath.row]
        cell.cellConfigure(model: model)
        
        return cell
    }
}


//MARK: - Public Methods

extension OnboardingView {
    
    @objc func actionButtonPressed() {
        switch collectionItem {
        case 0:
            nextPage()
            mainLabel.text = "sadasdasd"
        case 1:
            nextPage()
            actionButton.setTitle("Get Started", for: .normal)
        case 2:
            delegate?.actionButtonPressed()
        default: break
        }
    }
}


//MARK: - Private Methods

private extension OnboardingView {
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        configureCollectionView()
        configurePageControl()
        setDelegates()
        setConstraints()
    }
    
    func configureCollectionView() {
        
        guard let imageFirst = UIImage(named: "firstScreen"),
              let imageSecond = UIImage(named: "secondScreen") else {
            return
        }
        
        let firstScreen = OnboardingModel(mainImage: imageFirst)
        let secondScreen = OnboardingModel(mainImage: imageSecond)
        let thirdScreen = OnboardingModel(mainImage: imageFirst)
        
        onboardingArray = [firstScreen, secondScreen, thirdScreen]
    }
    
    func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func setupViews() {
        let views = [collectionView, pageControl, mainLabel, descriptionLabel, actionButton]
        
        views.forEach { addSubview($0) }
        
        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
    }
    
    
    func nextPage() {
        collectionItem += 1
        let index: IndexPath = [0, collectionItem]
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = collectionItem
    }
    
    
    func configurePageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        if #available(iOS 14.0, *) {
            pageControl.preferredIndicatorImage = UIImage(named: "largeIndicator")
        }
        
        pageControl.pageIndicatorTintColor = .greyLighter
        pageControl.currentPageIndicatorTintColor = .purplePrimary
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 340),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            
            mainLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 34),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
