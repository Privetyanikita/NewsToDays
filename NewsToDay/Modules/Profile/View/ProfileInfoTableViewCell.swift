//
//  ProfileInfoTableViewCell.swift
//  NewsToDay
//
//  Created by Ilya on 19.03.2024.
//

import UIKit
import SnapKit

class ProfileInfoTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ProfileInfoTableViewCell"
    
    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GreyLighter")
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let symbolImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        let customTextColor = UIColor(named: "GreyDarker")
        label.textColor = customTextColor
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        layoutViews()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.addSubview(cellBackgroundView)
        self.addSubview(symbolImage)
        self.addSubview(sectionLabel)
    }
    
    private func layoutViews() {
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
            
        }
        symbolImage.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(60)
        }
        
        sectionLabel.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(40)
            $0.top.equalToSuperview().offset(44)
        }
    }
    
    func setTitlesAndImage(title: String, image: UIImage) {
        sectionLabel.text = title
        symbolImage.image = image
    }
    
}



