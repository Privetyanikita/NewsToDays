//
//  LanguageViewController.swift
//  NewsToDay
//
//  Created by Ilya on 21.03.2024.
//

import UIKit

final class LanguageViewController: UIViewController {
    
    let dataSource: [ProfileCellModel] = [
        ProfileCellModel(title: NSLocalizedString("LanguageEnglish", comment: ""), image: UIImage(named:"Selected")),
        ProfileCellModel(title: NSLocalizedString("LanguageRussian", comment: ""), image: UIImage(named:"Selected")),
    ]
    
    private lazy var languageView: UIView = LanguageView(frame: .zero, dataSource: self.dataSource, navigationController: navigationController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(languageView)
        
        
        languageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let backButtonImage = UIImage(named: "BackImage")?.withRenderingMode(.alwaysOriginal)
        
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}




