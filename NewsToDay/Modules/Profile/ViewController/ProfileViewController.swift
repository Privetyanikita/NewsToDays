//
//  ProfileViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    let dataSource: [ProfileCellModel] = [
        ProfileCellModel(title: "Language", image: UIImage(named:"AngleRight")),
        ProfileCellModel(title:"Terms & Conditions", image: UIImage(named:"AngleRight")),
        ProfileCellModel(title: "Sign Out", image: UIImage(named:"SignOut"))
    ]
    
    private lazy var profileView: UIView = ProfileView(frame: .zero, dataSource: self.dataSource, navigationController: navigationController)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
        setupViews()
    }
    
    //MARK: - Methods
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(profileView)
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .purplePrimary
    }
    
    private func setupConstrains(){
        profileView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


