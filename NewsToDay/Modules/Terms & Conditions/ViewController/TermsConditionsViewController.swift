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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.title = NSLocalizedString("termsAndConditionsLabel", comment: "")
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.tintColor = .purplePrimary
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    
}
