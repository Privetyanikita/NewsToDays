//
//  TableViewCell.swift
//  NewsToDay
//
//  Created by Ilya on 21.03.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TableViewCell"
    
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
    
    func setHighlighted(_ highlighted: Bool) {
            if highlighted {
                symbolImage.isHidden = false
                sectionLabel.textColor = UIColor(named: "CustomWhite")
                cellBackgroundView.backgroundColor = UIColor(named: "PurplePrimary")
                symbolImage.tintColor = .white
            } else {
                symbolImage.isHidden = true
                cellBackgroundView.backgroundColor = UIColor(named: "GreyLighter")
                sectionLabel.textColor = UIColor(named: "GreyDarker")
                symbolImage.tintColor = .black
            }
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            setHighlighted(selected)
        }

        override func setHighlighted(_ highlighted: Bool, animated: Bool) {
            super.setHighlighted(highlighted, animated: animated)
            setHighlighted(highlighted)
        }
    }




