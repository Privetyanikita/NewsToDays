//
//  DetailViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Rectangle6")
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var colorView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.4)
        return element
    }()
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 24
        return element
    }()
    
    private lazy var articleView: UIView = {
        let element = UIView()
        return element
    }()
   
    private lazy var backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        element.tintColor = .white
        return element
    }()

    private lazy var favoriteButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "bookmark"), for: .normal)
        element.tintColor = .white
        return element
    }()
    
    private lazy var shareButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        element.tintColor = .white
        return element
    }()

    
    private lazy var categoryButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(named: "PurplePrimary")
        element.setTitle("Politics", for: .normal)                //изменится согласно API
        element.titleLabel?.font = UIFont(name: "Inter-Medium", size: 12)
        element.layer.cornerRadius = 10
        element.setTitleColor(.white, for: .normal)
        return element
    }()
    
    private lazy var titlelabel: UILabel = {
        let element = UILabel()
        element.text = "The latest situation in the presidential election"   //изменится согласно API
        element.textAlignment = .left
        element.font = UIFont(name: "Inter-SemiBold", size: 20)
        element.textColor = .white
        element.numberOfLines = 0
        element.lineBreakMode = .byWordWrapping
        return element
    }()

    private lazy var authorlabel: UILabel = {
        let element = UILabel()
        element.text = "John Doe"                                 //изменится согласно API
        element.textAlignment = .left
        element.font = UIFont(name: "Inter-Medium", size: 16)
        element.textColor = .white
        return element
    }()
    
    private lazy var articleLabel: UILabel = {
        let element = UILabel()
        element.text = "Result"                                    //изменится согласно API
        element.font = UIFont(name: "Inter-Medium", size: 16)
        element.textColor = .black
        element.textAlignment = .left
        return element
    }()
    
    //изменится согласно API
    private lazy var article: UITextView = {
        let element = UITextView()
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),
                            NSAttributedString.Key.foregroundColor: UIColor.gray,
        ]
        let myString = NSMutableAttributedString(string: "Leads in individual states may change from one party to another as all the votes are counted.", attributes: myAttribute )
        element.attributedText = myString
        element.backgroundColor = .clear
        element.isEditable = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setupConstraints()
    }
    
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(articleView)
        
        backgroundImageView.addSubview(colorView)
        backgroundImageView.addSubview(headerStackView)
        backgroundImageView.addSubview(backButton)
        backgroundImageView.addSubview(favoriteButton)
        backgroundImageView.addSubview(shareButton)
        
        headerStackView.addArrangedSubview(categoryButton)
        headerStackView.addArrangedSubview(titlelabel)
        headerStackView.addArrangedSubview(authorlabel)
        
        articleView.addSubview(articleLabel)
        articleView.addSubview(article)
    }
    
}

extension ViewController {
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(375)
        }
        
        colorView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundImageView)
        }
        
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(20)
            
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().inset(20)
        }
        
        shareButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(favoriteButton.snp.bottom).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(shareButton.snp.bottom).offset(24)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.height.equalTo(categoryButton.titleLabel!.intrinsicContentSize.height + 8)
            make.width.equalTo(categoryButton.titleLabel!.intrinsicContentSize.width + 16)
        }
        
        articleView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        articleLabel.snp.makeConstraints { make in
            make.top.equalTo(articleView.snp.top).inset(20)
            make.trailing.leading.equalTo(articleView)
        }
        
        article.snp.makeConstraints { make in
            make.top.equalTo(articleLabel.snp.bottom).offset(-8)
            make.leading.trailing.bottom.equalTo(articleView)
        }
        
    }
}
