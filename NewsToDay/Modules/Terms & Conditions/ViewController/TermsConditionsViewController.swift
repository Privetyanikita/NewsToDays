//
//  TermsConditionsViewController.swift
//  NewsToDay
//
//  Created by Ilya on 20.03.2024.
//

import UIKit
import SnapKit

final class TermsConditionsViewController: UIViewController {
    
    private lazy var termsConditionsView: UIView = TermsConditionsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(termsConditionsView)
        
        termsConditionsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        title = NSLocalizedString("termsAndConditionsLabel", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .purplePrimary
    }
    
    
    
}
