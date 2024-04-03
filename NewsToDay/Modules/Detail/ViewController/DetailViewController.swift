//
//  DetailViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit
import Kingfisher
import SafariServices
import FirebaseAuth

class DetailViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "mockimage")
        element.clipsToBounds = true
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
    
    private let backButton = UIButton(systemImageName: "arrow.left")
    private let favoriteButton = UIButton(systemImageName: "bookmark")
    private let shareButton = UIButton(systemImageName: "arrowshape.turn.up.right")
    
    
    private lazy var categoryButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(named: "PurplePrimary")
        element.setTitle("Politics", for: .normal)                //изменится согласно API
        element.titleLabel?.font = UIFont(name: "Inter-Medium", size: 12)
        element.layer.cornerRadius = 16
        element.setTitleColor(.white, for: .normal)
        return element
    }()
    
    private let titlelabel = UILabel(text: "Name of title will be here",
                                     font: UIFont(name: "Inter-SemiBold", size: 20),
                                     color: .white)
    
    private let authorlabel = UILabel(text: "Name of author here",
                                      font: UIFont(name: "Inter-Medium", size: 16),
                                      color: .white)
    
    private let articleLabel = UILabel(text: "Result here",
                                       font: UIFont(name: "Inter-Medium", size: 16),
                                       color: .black)
    
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
    
    private var urlForNews: String = ""
    private var dataForNews:News!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addAction()
        setViews()
        addAction()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeBookmarkImageButton()
        
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Setup
    ///прокидываем ячейку
    func configure(with news: News) {
        backgroundImageView.kf.setImage(with: URL(string: news.urlToImage ?? ""))
        titlelabel.text = news.title
        authorlabel.text = news.author
        articleLabel.text = news.description
        article.text = news.content
        urlForNews = news.url ?? "google.com"
        dataForNews = news
    }
    
    private func addAction() {
        backButton.addTarget(self, action: #selector(backButtonTappet), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTappet), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryButtonTappet), for: .touchUpInside)
    }
    
    @objc private func backButtonTappet() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //TODO: - добавить в закладки
    @objc private func favoriteButtonTapped() {
        print("add to favorite")
    }


    
    @objc private func shareButtonTappet() {
        let webController = SFSafariViewController(url: URL(string: urlForNews)!)
        present(webController, animated: true)
    }
    
    @objc private func categoryButtonTappet() {
        let categoriesVC = CategoriesViewController()
        self.navigationController?.pushViewController(categoriesVC, animated: true)
        self.navigationItem.hidesBackButton = true
    }
    
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(articleView)
        
        backgroundImageView.addSubview(colorView)
        headerStackView.addArrangedSubview(categoryButton)
        headerStackView.addArrangedSubview(titlelabel)
        headerStackView.addArrangedSubview(authorlabel)
        
        articleView.addSubview(articleLabel)
        articleView.addSubview(article)
        
        view.addSubview(backButton)
        view.addSubview(favoriteButton)
        view.addSubview(shareButton)
        view.addSubview(headerStackView)
    }
    
    private func changeBookmarkImageButton(){
        
    }
}

// MARK: - Extension

extension DetailViewController {
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.leading.equalToSuperview().inset(20)
            
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
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
            make.height.equalTo(categoryButton.titleLabel!.intrinsicContentSize.height + 16)
            make.width.equalTo(categoryButton.titleLabel!.intrinsicContentSize.width + 32)
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
            make.top.equalTo(articleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(articleView)
        }
        
    }
}
