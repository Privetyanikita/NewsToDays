//
//  ProfileViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit

final class ProfilelViewController: UIViewController {
    
    let dataSource: [ProfileCellModel] = [
        ProfileCellModel(title: "Language", image: UIImage(named:"AngleRight")),
        ProfileCellModel(title: "Terms & Conditions", image: UIImage(named:"AngleRight")),
        ProfileCellModel(title: "Sign Out", image: UIImage(named:"SignOut"))
    ]
    
    private lazy var profileView: UIView = ProfileView(frame: .zero, dataSource: self.dataSource)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileView)
        
        
        profileView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }


}
