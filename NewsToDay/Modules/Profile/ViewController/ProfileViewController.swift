//
//  ProfileViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    let dataSource: [ProfileCellModel] = [
        ProfileCellModel(title: NSLocalizedString("profileLanguage", comment: ""), image: UIImage(named:"AngleRight")),
        ProfileCellModel(title: NSLocalizedString("profileTermsAndConditions", comment: ""), image: UIImage(named:"AngleRight")),
        ProfileCellModel(title: NSLocalizedString("profileSignOut", comment: ""), image: UIImage(named:"SignOut"))
    ]
    
    private lazy var profileView: UIView = ProfileView(frame: .zero, dataSource: self.dataSource, navigationController: navigationController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
       
    }
}


