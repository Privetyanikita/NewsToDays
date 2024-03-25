//
//  SelectCategoriesView.swift
//  NewsToDay
//
//  Created by Evgenii Mazrukho on 25.03.2024.
//

import UIKit

//MARK: - OnboardingVC Delegate

protocol SelectCategoriesViewProtocol: AnyObject {
    func actionButtonPressed()
}


final class SelectCategoriesView: UIView {
    
    //MARK: - UI
    
    private let titleLabel = CustomLabel(text: SelectCategoriesMockData.titleLabel,
                                    alignment: .left,
                                    numberOfLines: 1,
                                    textColor: .blackPrimary,
                                    font: Font.getFont(.semibold, size: 24))

    private let categoriesView = CategoriesView(descriptionLabel: SelectCategoriesMockData.descriptionLabel)
    
    private lazy var nextButton = BlueButton(text: SelectCategoriesMockData.nextButton)
    
    
    //MARK: - Properties
    
    weak var delegate: SelectCategoriesViewProtocol?
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
        setupViews()
        setConstraints()
        
        nextButton.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private Methods

private extension SelectCategoriesView {
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupViews() {
        let views = [titleLabel, categoriesView, nextButton]
        views.forEach { addSubview($0) }
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
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
                
            categoriesView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoriesView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16),
            
            
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
