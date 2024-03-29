//
//  ProfileView.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import Foundation
import UIKit
import SnapKit

final class ProfileView: UIView {
    
    private var dataSource: [ProfileCellModel] = []
    
    // MARK: - Views
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "CustomWhite")
        return view
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-SemiBold", size: 24)
        label.textColor = UIColor(named: "BlackPrimary")
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var profileMainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileMainTableViewCell.self, forCellReuseIdentifier: ProfileMainTableViewCell.reuseIdentifier)
        tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: ProfileInfoTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
     
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    init(frame: CGRect, dataSource: [ProfileCellModel]) {
        super.init(frame: frame)
        self.dataSource = dataSource
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set Views
    private func setViews() {
        [backgroundView, profileLabel, profileMainTableView].forEach { self.addSubview($0) }
    }
    
    // MARK: Layout Views
    func layoutViews() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        profileLabel.snp.makeConstraints {
            $0.width.equalTo(75)
            $0.height.equalTo(32)
            $0.top.equalToSuperview().offset(85)
            $0.left.equalToSuperview().offset(20)
        }
        profileMainTableView.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).offset(20) // Расположение таблицы относительно profileLabel
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaInsets.bottom)
        }
        
        
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainTableViewCell.reuseIdentifier, for: indexPath) as? ProfileMainTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
            
        case 1, 2, 3:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.reuseIdentifier, for: indexPath) as? ProfileInfoTableViewCell else { return UITableViewCell() }
            cell.setTitlesAndImage(title: dataSource[indexPath.row - 1].title , image:dataSource[indexPath.row - 1].image ?? UIImage())
            cell.selectionStyle = .none
            return cell
    
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 72
        case 1:
            return 240 + 56 + 44
        case 2,3:
            return 56 + 44
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell tapped #\(indexPath.row)")
        
//        switch indexPath.row {
//        case 0:
//            
//        case 1:
//            
//        case 2,3:
//           
//        default:
//
//        }
    }
    
}


