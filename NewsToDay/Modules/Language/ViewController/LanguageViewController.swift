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
        
//        let backButtonImage = UIImage(named: "BackImage")?.withRenderingMode(.alwaysOriginal)
//        
//        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
//        navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.tintColor = .purplePrimary
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//    @objc func backButtonTapped() {
//        navigationController?.popViewController(animated: true)
//    }
}




